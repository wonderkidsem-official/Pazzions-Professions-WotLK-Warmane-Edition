-- This addon's own AH scanner. Instead of a full "getAll" dump (throttled to
-- once every 15 minutes and prone to disconnects on Warmane) it searches only
-- the items this addon cares about: guide materials you still need, tracked
-- items, and the reagents/products of recipes you know.
--
-- 3.3.5a's QueryAuctionItems has no exact-match flag, so a search for "Linen
-- Cloth" also returns "Bolt of Linen Cloth"; every listing is filtered by
-- item ID. Results land in the Browse tab like a normal search would.
local NS = PazzionsProfessions
NS.AuctionScan = {}
local Scan = NS.AuctionScan

local PAGE_SIZE = NUM_AUCTION_ITEMS_PER_PAGE or 50
local MAX_PAGES = 8
local DEFAULT_NEED = 20
-- Pause after a result page arrives before reading it, so owner/link data on
-- the page has filled in.
local SETTLE = 0.25

local ahOpen = false
local running = false
local items = {}     -- array of { id=, name=, need= }
local index = 0
local page = 0
local listings = {}  -- for the current item: { {unit=, count=}, ... }
local awaiting = false
local readAt = nil
local skipped = 0
local listeners = {}

function Scan:OnChange(fn)
	table.insert(listeners, fn)
end
local function Notify()
	for _, fn in ipairs(listeners) do
		fn()
	end
end

function Scan:IsAHOpen()
	return ahOpen
end

function Scan:IsRunning()
	return running
end

function Scan:Progress()
	local cur = items[index]
	return index, #items, cur and cur.name
end

----------------------------------------------------------------------------
-- What to scan
----------------------------------------------------------------------------
function Scan:BuildList()
	local need = {}
	local function Add(id, n)
		if id then
			need[id] = math.max(need[id] or 0, n or DEFAULT_NEED)
		end
	end

	for _, entry in ipairs(NS.Guide:ShoppingList(NS.Guide:MyGuidedProfessions())) do
		Add(entry.id, entry.need)
	end
	for id, target in pairs(NS.db.profile.trackerGoals) do
		Add(id, target)
	end
	local cache = NS.db.global.recipeCache
	for _, known in pairs(NS.Characters:Me().recipes) do
		for spellID in pairs(known) do
			local r = cache[spellID]
			if r then
				Add(r.item, 1)
				for id, n in pairs(r.reagents or {}) do
					Add(id, n)
				end
			end
		end
	end

	-- Vendor-only reagents (threads, vials, flux) are never worth searching.
	local list = {}
	skipped = 0
	for id, n in pairs(need) do
		if not NS.Prices:GetVendorBuy(id) then
			local name = GetItemInfo(id)
			if name then
				table.insert(list, { id = id, name = name, need = n })
			else
				NS.ItemCache:Request(id)
				skipped = skipped + 1
			end
		end
	end
	table.sort(list, function(a, b) return a.name < b.name end)
	return list
end

----------------------------------------------------------------------------
-- Running a scan
----------------------------------------------------------------------------
local driver = CreateFrame("Frame")
driver:Hide()

local function FinishItem()
	local item = items[index]
	table.sort(listings, function(a, b) return a.unit < b.unit end)
	local prices = NS:RealmDB().prices
	if #listings == 0 then
		prices[item.id] = { none = true, time = time() }
	else
		-- "market": average unit price of the cheapest listings that cover
		-- the quantity you need, so one cheap single doesn't set the price.
		local want = math.max(item.need or 1, 1)
		local bought, spent, available = 0, 0, 0
		for _, l in ipairs(listings) do
			available = available + l.count
			if bought < want then
				local take = math.min(l.count, want - bought)
				bought = bought + take
				spent = spent + take * l.unit
			end
		end
		prices[item.id] = {
			min = math.floor(listings[1].unit),
			market = math.floor(spent / bought),
			available = available,
			time = time(),
		}
	end
	wipe(listings)
	page = 0
	index = index + 1
	Notify()
end

local function ReadPage()
	local item = items[index]
	local numBatch, total = GetNumAuctionItems("list")
	for i = 1, numBatch do
		local _, _, count, _, _, _, _, _, buyout = GetAuctionItemInfo("list", i)
		local id = NS:ItemIDFromLink(GetAuctionItemLink("list", i))
		if id == item.id and buyout and buyout > 0 and count and count > 0 then
			table.insert(listings, { unit = buyout / count, count = count })
		end
	end
	if (page + 1) * PAGE_SIZE < total and page + 1 < MAX_PAGES then
		page = page + 1
	else
		FinishItem()
	end
end

local function Stop(message)
	running = false
	awaiting = false
	readAt = nil
	driver:Hide()
	wipe(listings)
	if message then
		NS:Print(message)
	end
	Notify()
end

driver:SetScript("OnUpdate", function()
	if not ahOpen then
		Stop("Scan stopped - auction house closed.")
		return
	end
	if readAt then
		if GetTime() >= readAt then
			readAt = nil
			ReadPage()
		end
		return
	end
	if awaiting then
		return
	end
	if index > #items then
		local n = #items
		Stop(string.format("Scan finished: %d item%s priced.", n, n == 1 and "" or "s"))
		return
	end
	if CanSendAuctionQuery() then
		awaiting = true
		-- isUsable/quality must be nil, not 0: 0 is truthy in Lua and would
		-- limit the search to items this character can use.
		QueryAuctionItems(items[index].name, nil, nil, 0, 0, 0, page, nil, nil)
	end
end)

function Scan:OnListUpdate()
	if running and awaiting then
		awaiting = false
		readAt = GetTime() + SETTLE
	end
end

function Scan:Start()
	if running then
		return
	end
	if not ahOpen then
		NS:Print("Open the auction house first, then scan.")
		return
	end
	items = self:BuildList()
	if #items == 0 then
		NS:Print(skipped > 0
			and "Item info is still loading from the server - try again in a few seconds."
			or "Nothing to scan: no guide materials, tracked items or known recipes yet. Open your profession windows first.")
		return
	end
	if skipped > 0 then
		NS:Print(string.format("%d item(s) skipped while their info loads from the server - scan again afterwards to include them.", skipped))
	end
	index, page = 1, 0
	wipe(listings)
	awaiting, readAt = false, nil
	running = true
	driver:Show()
	Notify()
end

function Scan:Stop()
	if running then
		Stop("Scan stopped.")
	end
end

----------------------------------------------------------------------------
-- Unified Auction House & TSM 2.8.3 Search
-- Searches for an item in TradeSkillMaster (Shopping module) if installed,
-- otherwise seamlessly falls back to the standard Blizzard Browse tab.
-- Returns true if a search was triggered. Never throws Lua errors!
----------------------------------------------------------------------------
function NS:SearchAuction(itemID, itemName)
	if not AuctionFrame or not AuctionFrame:IsShown() then
		self:Print("|cffff8040Auction House is not open.|r Please visit an Auctioneer first.")
		return false
	end

	local name = itemName
	if (not name or name == "") and itemID then
		name = GetItemInfo(itemID) or (self.ItemCache and self.ItemCache:Name(itemID))
	end

	if not name or name == "" then
		if itemID and self.ItemCache then
			self.ItemCache:Request(itemID)
		end
		self:Print("Item information pending, please try again in a moment.")
		return false
	end

	local searched = false

	-- 1. Check TradeSkillMaster (TSM 2.8.3 / Shopping)
	if TSMAPI and type(TSMAPI.StartSearch) == "function" then
		local ok = pcall(TSMAPI.StartSearch, TSMAPI, name)
		if ok then
			searched = true
		end
	end

	-- Try TradeSkillMaster_Shopping module directly
	if not searched then
		local TSM = _G["TradeSkillMaster"] or _G["TSM"]
		local Shopping = _G["TradeSkillMaster_Shopping"] or _G["TSM_Shopping"]
		if not Shopping and TSM and type(TSM.GetModule) == "function" then
			local ok, mod = pcall(TSM.GetModule, TSM, "Shopping", true)
			if ok and mod then
				Shopping = mod
			end
		end

		if Shopping then
			if type(Shopping.StartSearch) == "function" then
				local ok = pcall(Shopping.StartSearch, Shopping, name)
				if ok then searched = true end
			elseif type(Shopping.Search) == "function" then
				local ok = pcall(Shopping.Search, Shopping, name)
				if ok then searched = true end
			elseif type(Shopping.StartScan) == "function" then
				local ok = pcall(Shopping.StartScan, Shopping, name)
				if ok then searched = true end
			elseif type(Shopping.DoSearch) == "function" then
				local ok = pcall(Shopping.DoSearch, Shopping, name)
				if ok then searched = true end
			end
		end
	end

	-- If TSM Shopping is available, also ensure the Shopping tab on AuctionFrame is selected
	if searched or _G["TradeSkillMaster_Shopping"] or _G["TSM_Shopping"] then
		local numTabs = AuctionFrame.numTabs or 8
		for i = 1, numTabs do
			local tab = _G["AuctionFrameTab" .. i]
			if tab and tab:IsShown() then
				local tabText = (tab.GetText and tab:GetText()) or ""
				if tabText:find("Shopping") or tabText:find("TSM") then
					pcall(AuctionFrameTab_OnClick, tab)
					searched = true
					break
				end
			end
		end
	end

	-- 2. Fallback to standard Blizzard Auction House Browse tab
	if not searched then
		if AuctionFrameTab1 and AuctionFrame.selectedTab ~= 1 then
			pcall(AuctionFrameTab_OnClick, AuctionFrameTab1)
		end
		if BrowseName and AuctionFrameBrowse_Search then
			BrowseName:SetText(name)
			pcall(AuctionFrameBrowse_Search)
			searched = true
		end
	end

	return searched
end

-- Runs a search for one item (TSM if present, else standard AH).
-- Returns true if the search was started.
function Scan:SearchFor(itemID)
	return NS:SearchAuction(itemID)
end

----------------------------------------------------------------------------
-- AH frame button
----------------------------------------------------------------------------
local button, status

local function UpdateButton()
	if not button then
		return
	end
	if running then
		local i, n, name = Scan:Progress()
		button.text:SetText("Stop scan")
		status:SetText(string.format("JP: %d/%d %s", math.min(i, n), n, name or ""))
	else
		button.text:SetText("JP: Scan prices")
		local count, oldest = NS.Prices:Summary()
		if oldest then
			status:SetText(string.format("%d prices, oldest %s ago", count, NS:FormatDuration(math.max(60, time() - oldest))))
		else
			status:SetText("No prices scanned yet")
		end
	end
end

function Scan:OnAuctionHouseShow()
	ahOpen = true
	if not button and AuctionFrame then
		local Skin = NS.Skin
		button = Skin:CreateButton(AuctionFrame, 120, 20, "JP: Scan prices")
		button:SetPoint("BOTTOMRIGHT", AuctionFrame, "TOPRIGHT", -10, 2)
		button:SetScript("OnClick", function()
			if running then
				Scan:Stop()
			else
				Scan:Start()
			end
		end)
		status = AuctionFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		status:SetPoint("RIGHT", button, "LEFT", -8, 0)
		self:OnChange(UpdateButton)
	end
	UpdateButton()
	Notify()
end

function Scan:OnAuctionHouseClosed()
	ahOpen = false
	if running then
		Stop("Scan stopped - auction house closed.")
	end
	Notify()
end
