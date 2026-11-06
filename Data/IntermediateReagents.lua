-- Intermediate craftable reagents for WotLK 3.3.5a professions.
-- Maps intermediate craft products to their required raw materials and profession.
-- Used by Guide:RemainingMats to resolve intermediate craft items (e.g. Bolts, Grinding Stones,
-- Powders, Settings, Wires, Inks) into their true raw materials when calculating shopping requirements.
local NS = PazzionsProfessions

NS.INTERMEDIATES = {
	-- Tailoring
	[2996] = { prof = "Tailoring", made = 1, reagents = { [2589] = 2 } }, -- Bolt of Linen Cloth <- 2x Linen Cloth
	[2997] = { prof = "Tailoring", made = 1, reagents = { [2592] = 3 } }, -- Bolt of Woolen Cloth <- 3x Wool Cloth
	[4305] = { prof = "Tailoring", made = 1, reagents = { [4306] = 4 } }, -- Bolt of Silk Cloth <- 4x Silk Cloth
	[4339] = { prof = "Tailoring", made = 1, reagents = { [4338] = 4 } }, -- Bolt of Mageweave <- 4x Mageweave Cloth
	[14048] = { prof = "Tailoring", made = 1, reagents = { [14047] = 4 } }, -- Bolt of Runecloth <- 4x Runecloth
	[21840] = { prof = "Tailoring", made = 1, reagents = { [21877] = 5 } }, -- Bolt of Netherweave <- 5x Netherweave Cloth
	[21842] = { prof = "Tailoring", made = 1, reagents = { [21840] = 3, [22445] = 2 } }, -- Bolt of Imbued Netherweave <- 3x Bolt of Netherweave, 2x Arcane Dust
	[41510] = { prof = "Tailoring", made = 1, reagents = { [33470] = 5 } }, -- Bolt of Frostweave <- 5x Frostweave Cloth
	[41511] = { prof = "Tailoring", made = 1, reagents = { [41510] = 2, [34054] = 2 } }, -- Bolt of Imbued Frostweave <- 2x Bolt of Frostweave, 2x Infinite Dust

	-- Blacksmithing
	[3470] = { prof = "Blacksmithing", made = 1, reagents = { [2835] = 2 } }, -- Rough Grinding Stone <- 2x Rough Stone
	[3478] = { prof = "Blacksmithing", made = 1, reagents = { [2836] = 2 } }, -- Coarse Grinding Stone <- 2x Coarse Stone
	[3486] = { prof = "Blacksmithing", made = 1, reagents = { [2838] = 3 } }, -- Heavy Grinding Stone <- 3x Heavy Stone
	[7966] = { prof = "Blacksmithing", made = 1, reagents = { [7912] = 4 } }, -- Solid Grinding Stone <- 4x Solid Stone
	[12644] = { prof = "Blacksmithing", made = 1, reagents = { [12365] = 4 } }, -- Dense Grinding Stone <- 4x Dense Stone

	-- Engineering
	[4357] = { prof = "Engineering", made = 1, reagents = { [2835] = 1 } }, -- Rough Blasting Powder <- 1x Rough Stone
	[4359] = { prof = "Engineering", made = 1, reagents = { [2840] = 1 } }, -- Handful of Copper Bolts <- 1x Copper Bar
	[4364] = { prof = "Engineering", made = 1, reagents = { [2836] = 1 } }, -- Coarse Blasting Powder <- 1x Coarse Stone
	[4404] = { prof = "Engineering", made = 1, reagents = { [2842] = 1 } }, -- Silver Contact <- 1x Silver Bar
	[4371] = { prof = "Engineering", made = 1, reagents = { [2841] = 2, [2880] = 1 } }, -- Bronze Tube <- 2x Bronze Bar, 1x Weak Flux
	[4375] = { prof = "Engineering", made = 1, reagents = { [2841] = 2, [2592] = 1 } }, -- Whirring Bronze Gizmo <- 2x Bronze Bar, 1x Wool Cloth
	[4377] = { prof = "Engineering", made = 1, reagents = { [2838] = 1 } }, -- Heavy Blasting Powder <- 1x Heavy Stone
	[4382] = { prof = "Engineering", made = 1, reagents = { [2841] = 2, [2319] = 1, [2592] = 1 } }, -- Bronze Framework <- 2x Bronze Bar, 1x Medium Leather, 1x Wool Cloth
	[10505] = { prof = "Engineering", made = 1, reagents = { [7912] = 2 } }, -- Solid Blasting Powder <- 2x Solid Stone
	[10559] = { prof = "Engineering", made = 1, reagents = { [3860] = 3 } }, -- Mithril Tube <- 3x Mithril Bar
	[10560] = { prof = "Engineering", made = 1, reagents = { [3860] = 1, [4338] = 1, [10505] = 1 } }, -- Unstable Trigger <- 1x Mithril Bar, 1x Mageweave Cloth, 1x Solid Blasting Powder
	[10561] = { prof = "Engineering", made = 1, reagents = { [3860] = 3 } }, -- Mithril Casing <- 3x Mithril Bar
	[15992] = { prof = "Engineering", made = 1, reagents = { [12365] = 2 } }, -- Dense Blasting Powder <- 2x Dense Stone
	[15994] = { prof = "Engineering", made = 1, reagents = { [12359] = 3, [14047] = 1 } }, -- Thorium Widget <- 3x Thorium Bar, 1x Runecloth
	[23781] = { prof = "Engineering", made = 4, reagents = { [21870] = 1, [22573] = 2 } }, -- Elemental Blasting Powder <- 1x Mote of Fire, 2x Mote of Earth (yields 4)
	[23782] = { prof = "Engineering", made = 1, reagents = { [23445] = 3 } }, -- Fel Iron Casing <- 3x Fel Iron Bar
	[23783] = { prof = "Engineering", made = 1, reagents = { [23445] = 1 } }, -- Handful of Fel Iron Bolts <- 1x Fel Iron Bar
	[23784] = { prof = "Engineering", made = 1, reagents = { [23446] = 4, [22452] = 1 } }, -- Adamantite Frame <- 4x Adamantite Bar, 1x Primal Earth
	[39681] = { prof = "Engineering", made = 2, reagents = { [36916] = 2 } }, -- Handful of Cobalt Bolts <- 2x Cobalt Bar (yields 1-3, avg 2)
	[39682] = { prof = "Engineering", made = 1, reagents = { [36916] = 4, [37700] = 1 } }, -- Overcharged Capacitor <- 4x Cobalt Bar, 1x Crystallized Earth
	[39683] = { prof = "Engineering", made = 1, reagents = { [36916] = 8, [37705] = 1 } }, -- Froststeel Tube <- 8x Cobalt Bar, 1x Crystallized Water
	[39690] = { prof = "Engineering", made = 2, reagents = { [36916] = 3, [37705] = 1 } }, -- Volatile Blasting Trigger <- 3x Cobalt Bar, 1x Crystallized Water (yields 2)

	-- Jewelcrafting
	[20816] = { prof = "Jewelcrafting", made = 1, reagents = { [2840] = 2 } }, -- Delicate Copper Wire <- 2x Copper Bar
	[20817] = { prof = "Jewelcrafting", made = 1, reagents = { [2841] = 2 } }, -- Bronze Setting <- 2x Bronze Bar
	[20963] = { prof = "Jewelcrafting", made = 1, reagents = { [3860] = 2 } }, -- Mithril Filigree <- 2x Mithril Bar
	[21752] = { prof = "Jewelcrafting", made = 1, reagents = { [12359] = 1 } }, -- Thorium Setting <- 1x Thorium Bar
	[31079] = { prof = "Jewelcrafting", made = 1, reagents = { [24243] = 4, [22452] = 1 } }, -- Mercurial Adamantite <- 4x Adamantite Powder, 1x Primal Earth

	-- Leatherworking
	[2318] = { prof = "Leatherworking", made = 1, reagents = { [2934] = 3 } }, -- Light Leather <- 3x Ruined Leather Scraps
	[4234] = { prof = "Leatherworking", made = 1, reagents = { [2319] = 5 } }, -- Heavy Leather <- 5x Medium Leather
	[4236] = { prof = "Leatherworking", made = 1, reagents = { [4235] = 1, [4289] = 3 } }, -- Cured Heavy Hide <- 1x Heavy Hide, 3x Salt
	[23793] = { prof = "Leatherworking", made = 1, reagents = { [21887] = 5 } }, -- Heavy Knothide Leather <- 5x Knothide Leather
	[38425] = { prof = "Leatherworking", made = 1, reagents = { [33568] = 6 } }, -- Heavy Borean Leather <- 6x Borean Leather

	-- Inscription (Inks from Pigments)
	[37101] = { prof = "Inscription", made = 1, reagents = { [39151] = 1 } }, -- Ivory Ink <- 1x Alabaster Pigment
	[39469] = { prof = "Inscription", made = 1, reagents = { [39151] = 2 } }, -- Moonglow Ink <- 2x Alabaster Pigment
	[39774] = { prof = "Inscription", made = 1, reagents = { [39334] = 2 } }, -- Midnight Ink <- 2x Dusky Pigment
	[43116] = { prof = "Inscription", made = 1, reagents = { [39338] = 2 } }, -- Lion's Ink <- 2x Golden Pigment
	[43118] = { prof = "Inscription", made = 1, reagents = { [39339] = 2 } }, -- Jadefire Ink <- 2x Emerald Pigment
	[43120] = { prof = "Inscription", made = 1, reagents = { [39340] = 2 } }, -- Celestial Ink <- 2x Violet Pigment
	[43122] = { prof = "Inscription", made = 1, reagents = { [39341] = 2 } }, -- Shimmering Ink <- 2x Silvery Pigment
	[43124] = { prof = "Inscription", made = 1, reagents = { [39342] = 2 } }, -- Ethereal Ink <- 2x Nether Pigment
	[43126] = { prof = "Inscription", made = 1, reagents = { [39343] = 2 } }, -- Ink of the Sea <- 2x Azure Pigment
	[43127] = { prof = "Inscription", made = 1, reagents = { [43109] = 2 } }, -- Snowfall Ink <- 2x Icy Pigment
}
