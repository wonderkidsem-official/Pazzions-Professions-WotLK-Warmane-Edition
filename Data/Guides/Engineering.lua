-- Engineering leveling route 1-450 (WotLK 3.3.5a - Warmane Icecrown Optimized).
-- Intermediate crafts (Bolts, Tubes, Powder, Triggers, Casings) are prioritized
-- and stockpiled so they supply skill-ups and reagents for subsequent tiers with RNG safety margins.
PazzionsProfessions:RegisterGuide("Engineering", {
	-- Rough Blasting Powder <- 1x Rough Stone
	{ from = 1, to = 30, spell = 3918, item = 4357, count = 45, reagents = { [2835] = 1 }, note = "Rough Blasting Powder will be used for Rough Copper Bombs, keep them all." },
	-- Handful of Copper Bolts <- 1x Copper Bar
	{ from = 30, to = 50, spell = 3922, item = 4359, count = 35, reagents = { [2840] = 1 }, note = "Save all Copper Bolts for bombs and scopes." },
	-- Arclight Spanner <- 6x Copper Bar
	{ from = 50, to = 51, spell = 7430, item = 6219, count = 1, reagents = { [2840] = 6 }, note = "Keep this tool in your bags permanently for crafting recipes." },
	-- Rough Copper Bomb <- 1x Linen Cloth, 1x Copper Bar, 2x Rough Blasting Powder, 1x Handful of Copper Bolts
	{ from = 51, to = 75, spell = 3923, item = 4360, count = 27, reagents = { [2589] = 1, [2840] = 1, [4357] = 2, [4359] = 1 } },
	-- Coarse Blasting Powder <- 1x Coarse Stone
	{ from = 75, to = 90, spell = 3929, item = 4364, count = 35, reagents = { [2836] = 1 }, note = "Save all Coarse Blasting Powder for dynamite." },
	-- Coarse Dynamite <- 1x Linen Cloth, 3x Coarse Blasting Powder
	{ from = 90, to = 100, spell = 3931, item = 4365, count = 18, reagents = { [2589] = 1, [4364] = 3 } },
	-- Silver Contact <- 1x Silver Bar
	{ from = 100, to = 105, spell = 3973, item = 4404, count = 6, reagents = { [2842] = 1 } },
	-- Bronze Tube <- 2x Bronze Bar, 1x Weak Flux
	{ from = 105, to = 125, spell = 3938, item = 4371, count = 24, reagents = { [2841] = 2, [2880] = 1 }, note = "Weak Flux is sold by Engineering Supply vendors near your trainer." },
	-- Heavy Blasting Powder <- 1x Heavy Stone
	{ from = 125, to = 135, spell = 3945, item = 4377, count = 20, reagents = { [2838] = 1 }, note = "Save all Heavy Blasting Powder for Explosive Sheep." },
	-- Whirring Bronze Gizmo <- 2x Bronze Bar, 1x Wool Cloth
	{ from = 135, to = 145, spell = 3946, item = 4375, count = 18, reagents = { [2841] = 2, [2592] = 1 }, note = "Keep all Whirring Bronze Gizmos for Explosive Sheep." },
	-- Bronze Framework <- 1x Medium Leather, 1x Wool Cloth, 2x Bronze Bar
	{ from = 145, to = 160, spell = 3953, item = 4382, count = 20, reagents = { [2319] = 1, [2592] = 1, [2841] = 2 }, note = "Keep Bronze Frameworks for Explosive Sheep." },
	-- Explosive Sheep <- 2x Wool Cloth, 1x Whirring Bronze Gizmo, 2x Heavy Blasting Powder, 1x Bronze Framework
	{ from = 160, to = 175, spell = 3955, item = 4384, count = 18, reagents = { [2592] = 2, [4375] = 1, [4377] = 2, [4382] = 1 }, note = "Keep 5 of these if you choose Goblin Engineering at 200." },
	-- Solid Blasting Powder <- 2x Solid Stone
	{ from = 175, to = 194, spell = 12585, item = 10505, count = 45, reagents = { [7912] = 2 }, note = "Save Solid Blasting Powder for Unstable Triggers and Hi-Explosive Bombs." },
	-- Gyromatic Micro-Adjustor <- 4x Steel Bar
	{ from = 194, to = 195, spell = 12590, item = 10498, count = 1, reagents = { [3859] = 4 }, note = "Keep this tool permanently in your bags." },
	-- Mithril Tube <- 3x Mithril Bar
	{ from = 195, to = 200, spell = 12589, item = 10559, count = 9, reagents = { [3860] = 3 }, note = "Keep 6 Mithril Tubes if you choose Gnomish Engineering at 200." },
	-- Unstable Trigger <- 1x Mithril Bar, 1x Mageweave Cloth, 1x Solid Blasting Powder
	{ from = 200, to = 215, spell = 12591, item = 10560, count = 25, reagents = { [3860] = 1, [4338] = 1, [10505] = 1 }, note = "Save all Unstable Triggers for Hi-Explosive Bombs." },
	-- Mithril Casing <- 3x Mithril Bar
	{ from = 215, to = 238, spell = 12599, item = 10561, count = 45, reagents = { [3860] = 3 }, note = "Save all Mithril Casings for Hi-Explosive Bombs. Extra Mithril Bar budgeted to absorb yellow range." },
	-- Hi-Explosive Bomb <- 2x Solid Blasting Powder, 1x Unstable Trigger, 2x Mithril Casing
	{ from = 238, to = 250, spell = 12619, item = 10562, count = 22, reagents = { [10505] = 2, [10560] = 1, [10561] = 2 }, note = "Yellow recipe; extra materials budgeted to absorb bad luck." },
	-- Dense Blasting Powder <- 2x Dense Stone
	{ from = 250, to = 260, spell = 19788, item = 15992, count = 25, reagents = { [12365] = 2 }, note = "Keep at least 15 Dense Blasting Powder for Thorium Shells." },
	-- Thorium Widget <- 3x Thorium Bar, 1x Runecloth
	{ from = 260, to = 285, spell = 19791, item = 15994, count = 35, reagents = { [12359] = 3, [14047] = 1 }, note = "Turns yellow at 280; extra Thorium Bar budgeted." },
	-- Thorium Shells <- 2x Thorium Bar, 1x Dense Blasting Powder
	{ from = 285, to = 300, spell = 19800, item = 15997, count = 22, reagents = { [12359] = 2, [15992] = 1 }, note = "Turns yellow at 295; extra Thorium Bar budgeted." },
	-- Handful of Fel Iron Bolts <- 1x Fel Iron Bar
	{ from = 300, to = 305, spell = 30305, item = 23783, count = 18, reagents = { [23445] = 1 }, note = "Learned at 300. Save all Fel Iron Bolts for bombs and flares." },
	-- Fel Iron Casing <- 3x Fel Iron Bar
	{ from = 305, to = 310, spell = 30304, item = 23782, count = 15, reagents = { [23445] = 3 }, note = "Learned at 300 (Orange 300-310). Save Fel Iron Casings for Fel Iron Bombs." },
	-- Elemental Blasting Powder <- 1x Mote of Fire, 2x Mote of Earth (yields 4)
	{ from = 310, to = 320, spell = 30303, item = 23781, count = 20, reagents = { [21870] = 1, [22573] = 2 }, made = 4, note = "Learned at 300 (Orange 300-310, Yellow 310-320). Craft from Mote of Fire + Earth (yields 4), or buy powder from AH. Needed for bombs and flares." },
	-- Fel Iron Bomb <- 1x Elemental Blasting Powder, 1x Fel Iron Casing, 2x Handful of Fel Iron Bolts
	{ from = 320, to = 335, spell = 30310, item = 23736, count = 20, reagents = { [23781] = 1, [23782] = 1, [23783] = 2 }, note = "Learned at 320 (Orange 320-335)." },
	-- White Smoke Flare <- 1x Netherweave Cloth, 1x Elemental Blasting Powder
	{ from = 335, to = 350, spell = 30341, item = 23768, count = 40, reagents = { [21877] = 1, [23781] = 1 }, note = "Schematic sold by Wind Trader Lathrai (Shattrath) or Feera (Exodar) / Yarr Hammerstone (Mulgore). Alternative: Adamantite Grenade." },
	-- Handful of Cobalt Bolts <- 2x Cobalt Bar (yields 1-3, avg 2)
	{ from = 350, to = 360, spell = 56349, item = 39681, count = 25, reagents = { [36916] = 2 }, made = 2, note = "Learned at 350 (Orange 350-360). Save all Cobalt Bolts for scopes and noise machines." },
	-- Volatile Blasting Trigger <- 3x Cobalt Bar, 1x Crystallized Water (yields 2)
	{ from = 360, to = 375, spell = 53281, item = 39690, count = 25, reagents = { [36916] = 3, [37705] = 1 }, made = 2, note = "Learned at 350 (Orange 350-360, Yellow 360-370). Creates 2 per craft. Save for Decoys and Box of Bombs." },
	-- Overcharged Capacitor <- 4x Cobalt Bar, 1x Crystallized Earth
	{ from = 375, to = 385, spell = 56464, item = 39682, count = 15, reagents = { [36916] = 4, [37700] = 1 }, note = "Learned at 375. Save for Noise Machines." },
	-- Explosive Decoy <- 1x Frostweave Cloth, 3x Volatile Blasting Trigger
	{ from = 385, to = 390, spell = 56463, item = 40536, count = 10, reagents = { [33470] = 1, [39690] = 3 } },
	-- Froststeel Tube <- 8x Cobalt Bar, 1x Crystallized Water
	{ from = 390, to = 400, spell = 56471, item = 39683, count = 15, reagents = { [36916] = 8, [37705] = 1 }, note = "Save Froststeel Tubes for Scopes and Noise Machines." },
	-- Diamond-cut Refractor Scope <- 2x Handful of Cobalt Bolts, 1x Froststeel Tube
	{ from = 400, to = 405, spell = 61471, item = 44739, count = 8, reagents = { [39681] = 2, [39683] = 1 } },
	-- Box of Bombs <- 5x Saronite Bar, 1x Volatile Blasting Trigger
	{ from = 405, to = 415, spell = 56468, item = 44951, count = 15, reagents = { [36913] = 5, [39690] = 1 }, note = "Turns yellow at 410; extra Saronite budgeted." },
	-- Mana Injector Kit <- 12x Saronite Bar, 2x Crystallized Water
	{ from = 415, to = 425, spell = 56477, item = 42546, count = 15, reagents = { [36913] = 12, [37705] = 2 }, note = "Turns yellow at 420; extra Saronite budgeted." },
	-- Mechanized Snow Goggles <- 2x Borean Leather, 1x Eternal Shadow, 8x Saronite Bar
	{ from = 425, to = 430, spell = 61483, item = 44742, count = 8, reagents = { [33568] = 2, [35627] = 1, [36913] = 8 } },
	-- Noise Machine <- 8x Handful of Cobalt Bolts, 2x Overcharged Capacitor, 2x Froststeel Tube
	{ from = 430, to = 435, spell = 56467, item = 40865, count = 8, reagents = { [39681] = 8, [39682] = 2, [39683] = 2 } },
	-- Gnomish Army Knife <- 1x Mining Pick, 1x Blacksmith Hammer, 1x Skinning Knife, 10x Saronite Bar
	{ from = 435, to = 450, spell = 56462, item = 40772, count = 35, reagents = { [2901] = 1, [5956] = 1, [7005] = 1, [36913] = 10 }, note = "Tools are vendor bought. Yellow from 440, Green from 445; generous Saronite buffer budgeted to reach 450 safely." },
})
