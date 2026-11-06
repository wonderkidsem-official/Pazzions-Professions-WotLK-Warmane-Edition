-- AceAddon lifecycle + event wiring. Data modules record, then a single
-- throttled redraw updates whichever windows are open.
local NS = PazzionsProfessions
local Chars = NS.Characters

local redraw = CreateFrame("Frame")
redraw:Hide()
local redrawWait = 0
redraw:SetScript("OnUpdate", function(self, elapsed)
	redrawWait = redrawWait - elapsed
	if redrawWait > 0 then
		return
	end
	self:Hide()
	NS.MainWindow:Refresh()
	NS.MiniGuide:Refresh()
	NS.TrackerWindow:Refresh()
end)

function NS:RequestRedraw()
	if not redraw:IsShown() then
		redrawWait = 0.2
		redraw:Show()
	end
end

function PazzionsProfessions:OnEnable()
	Chars:Init()

	Chars:OnChange(function(what)
		if what == "items" then
			NS.Tracker:CheckGoals()
		end
		NS:RequestRedraw()
	end)
	NS.Tracker:OnChange(function() NS:RequestRedraw() end)
	NS.AuctionScan:OnChange(function() NS:RequestRedraw() end)
	NS.ItemCache:OnUpdate(function() NS:RequestRedraw() end)

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("SKILL_LINES_CHANGED")
	self:RegisterEvent("PLAYER_LEVEL_UP", "OnBasicsChanged")
	self:RegisterEvent("PLAYER_MONEY", "OnBasicsChanged")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("BANKFRAME_OPENED")
	self:RegisterEvent("BANKFRAME_CLOSED")
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	self:RegisterEvent("MAIL_INBOX_UPDATE")
	self:RegisterEvent("TRADE_SKILL_SHOW")
	self:RegisterEvent("TRADE_SKILL_UPDATE")
	self:RegisterEvent("TRADE_SKILL_CLOSE")
	self:RegisterEvent("AUCTION_HOUSE_SHOW")
	self:RegisterEvent("AUCTION_HOUSE_CLOSED")
	self:RegisterEvent("AUCTION_ITEM_LIST_UPDATE")
end

function PazzionsProfessions:OnDisable()
	self:UnregisterAllEvents()
end

local loggedIn = false
function PazzionsProfessions:PLAYER_ENTERING_WORLD()
	Chars:UpdateBasics()
	Chars:ScanSkills()
	Chars:ScanBags()
	if not loggedIn then
		loggedIn = true
		NS.Tracker:Init()
		NS.Cooldowns:AnnounceReady()
	end
end

function PazzionsProfessions:SKILL_LINES_CHANGED()
	if Chars.ignoreSkillEventsUntil and GetTime() < Chars.ignoreSkillEventsUntil then
		return
	end
	Chars:Schedule("skills")
end

function PazzionsProfessions:OnBasicsChanged()
	Chars:UpdateBasics()
	NS:RequestRedraw()
end

function PazzionsProfessions:BAG_UPDATE(_, bag)
	if bag and bag > NUM_BAG_SLOTS then
		Chars:Schedule("bank")
	else
		Chars:Schedule("bags")
	end
end

function PazzionsProfessions:BANKFRAME_OPENED()
	Chars:SetBankOpen(true)
end

function PazzionsProfessions:BANKFRAME_CLOSED()
	Chars:SetBankOpen(false)
end

function PazzionsProfessions:PLAYERBANKSLOTS_CHANGED()
	Chars:Schedule("bank")
end

function PazzionsProfessions:MAIL_INBOX_UPDATE()
	Chars:Schedule("mail")
end

function PazzionsProfessions:TRADE_SKILL_SHOW()
	Chars:ScanTradeSkill()
	NS.MiniGuide:OnTradeSkillShow()
end

function PazzionsProfessions:TRADE_SKILL_UPDATE()
	Chars:Schedule("trade", 0.3)
end

function PazzionsProfessions:TRADE_SKILL_CLOSE()
	NS.MiniGuide:OnTradeSkillClose()
end

function PazzionsProfessions:AUCTION_HOUSE_SHOW()
	NS.AuctionScan:OnAuctionHouseShow()
end

function PazzionsProfessions:AUCTION_HOUSE_CLOSED()
	NS.AuctionScan:OnAuctionHouseClosed()
end

function PazzionsProfessions:AUCTION_ITEM_LIST_UPDATE()
	NS.AuctionScan:OnListUpdate()
end
