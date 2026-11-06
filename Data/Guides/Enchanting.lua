-- Enchanting leveling route 1-450 (WotLK 3.3.5a - Warmane Icecrown Optimized).
-- Rod upgrades are included at exact thresholds to enable subsequent tiers.
PazzionsProfessions:RegisterGuide("Enchanting", {
	-- Runed Copper Rod <- 1x Copper Rod, 1x Lesser Magic Essence, 1x Strange Dust
	{ from = 1, to = 2, spell = 7421, item = 6218, count = 1, reagents = { [6217] = 1, [10938] = 1, [10940] = 1 }, note = "Copper Rod sold by Trade / Enchanting vendors. Keep your rod permanently." },
	-- Enchant Bracer: Minor Health <- 1x Strange Dust
	{ from = 2, to = 50, spell = 7418, count = 18, reagents = { [10940] = 1 } },
	-- Enchant Bracer: Minor Health <- 1x Strange Dust
	{ from = 50, to = 90, spell = 7418, count = 15, reagents = { [10940] = 1 } },
	-- Enchant Bracer: Minor Stamina <- 3x Strange Dust
	{ from = 90, to = 100, spell = 7457, count = 5, reagents = { [10940] = 3 } },
	-- Runed Silver Rod <- 1x Runed Copper Rod, 1x Silver Rod, 3x Greater Magic Essence, 6x Strange Dust
	{ from = 100, to = 101, spell = 7795, item = 6339, count = 1, reagents = { [6218] = 1, [6338] = 1, [10939] = 3, [10940] = 6 } },
	-- Greater Magic Wand <- 1x Simple Wood, 1x Greater Magic Essence
	{ from = 101, to = 110, spell = 14807, item = 11288, count = 4, reagents = { [4470] = 1, [10939] = 1 } },
	-- Enchant Cloak: Minor Agility <- 1x Lesser Astral Essence
	{ from = 110, to = 135, spell = 13419, count = 10, reagents = { [10998] = 1 } },
	-- Enchant Bracer - Lesser Stamina <- 2x Soul Dust
	{ from = 135, to = 155, spell = 13501, count = 8, reagents = { [11083] = 2 } },
	-- Runed Golden Rod <- 1x Iridescent Pearl, 1x Runed Silver Rod, 2x Greater Astral Essence, 2x Soul Dust, 1x Golden Rod
	{ from = 155, to = 156, spell = 13628, item = 11130, count = 1, reagents = { [5500] = 1, [6339] = 1, [11082] = 2, [11083] = 2, [11128] = 1 } },
	-- Enchant Bracer - Lesser Strength <- 2x Soul Dust
	{ from = 156, to = 185, spell = 13536, count = 12, reagents = { [11083] = 2 } },
	-- Enchant Bracer: Strength <- 1x Vision Dust
	{ from = 185, to = 200, spell = 13661, count = 6, reagents = { [11137] = 1 } },
	-- Runed Truesilver Rod <- 1x Black Pearl, 1x Runed Golden Rod, 2x Greater Mystic Essence, 2x Vision Dust, 1x Truesilver Rod
	{ from = 200, to = 201, spell = 13702, item = 11145, count = 1, reagents = { [7971] = 1, [11130] = 1, [11135] = 2, [11137] = 2, [11144] = 1 } },
	-- Enchant Bracer: Strength <- 1x Vision Dust
	{ from = 201, to = 220, spell = 13661, count = 8, reagents = { [11137] = 1 } },
	-- Enchant Cloak: Greater Defense <- 3x Vision Dust
	{ from = 220, to = 225, spell = 13746, count = 3, reagents = { [11137] = 3 } },
	-- Enchant Gloves: Agility <- 1x Vision Dust, 1x Lesser Nether Essence
	{ from = 225, to = 230, spell = 13815, count = 3, reagents = { [11137] = 1, [11174] = 1 } },
	-- Enchant Boots - Stamina <- 5x Vision Dust
	{ from = 230, to = 235, spell = 13836, count = 3, reagents = { [11137] = 5 } },
	-- Enchant Chest: Superior Health <- 6x Vision Dust
	{ from = 235, to = 250, spell = 13858, count = 6, reagents = { [11137] = 6 } },
	-- Lesser Mana Oil <- 2x Purple Lotus, 1x Crystal Vial, 3x Dream Dust
	{ from = 250, to = 265, spell = 25127, item = 20747, count = 6, reagents = { [8831] = 2, [8925] = 1, [11176] = 3 } },
	-- Enchant Shield: Greater Stamina <- 5x Dream Dust
	{ from = 265, to = 290, spell = 20017, count = 10, reagents = { [11176] = 5 }, note = "Recipe sold by Daniel Bartlett (Undercity) or Mythrin'dir (Darnassus)." },
	-- Enchant Chest - Major Mana <- 8x Illusion Dust
	{ from = 290, to = 299, spell = 20028, count = 4, reagents = { [16204] = 8 } },
	-- Runed Arcanite Rod <- 1x Runed Truesilver Rod, 1x Golden Pearl, 2x Large Brilliant Shard, 4x Greater Eternal Essence, 10x Illusion Dust, 1x Arcanite Rod
	{ from = 299, to = 300, spell = 20051, item = 16207, count = 1, reagents = { [11145] = 1, [13926] = 1, [14344] = 2, [16203] = 4, [16204] = 10, [16206] = 1 }, note = "Formula sold by Lorelae Wintersong in Moonglade." },
	-- Runed Fel Iron Rod <- 6x Large Brilliant Shard, 4x Greater Eternal Essence, 1x Runed Arcanite Rod, 1x Fel Iron Rod
	{ from = 300, to = 310, spell = 32664, item = 22461, count = 1, reagents = { [14344] = 6, [16203] = 4, [16207] = 1, [25843] = 1 } },
	-- Bracer - Brawn <- 6x Arcane Dust
	{ from = 310, to = 316, spell = 27899, count = 3, reagents = { [22445] = 6 } },
	-- Gloves - Assault <- 8x Arcane Dust
	{ from = 316, to = 330, spell = 33996, count = 6, reagents = { [22445] = 8 } },
	-- Shield - Major Stamina <- 15x Arcane Dust
	{ from = 330, to = 335, spell = 34009, count = 3, reagents = { [22445] = 15 } },
	-- Shield - Resilience <- 4x Lesser Planar Essence, 1x Large Prismatic Shard
	{ from = 335, to = 340, spell = 44383, count = 3, reagents = { [22447] = 4, [22449] = 1 } },
	-- Superior Wizard Oil <- 1x Imbued Vial, 3x Arcane Dust, 1x Nightmare Vine
	{ from = 340, to = 350, spell = 28019, item = 22522, count = 10, reagents = { [18256] = 1, [22445] = 3, [22792] = 1 }, note = "Recipe sold by Madame Ruby at Shattrath City." },
	-- Runed Adamantite Rod <- 8x Greater Planar Essence, 8x Large Prismatic Shard, 1x Runed Fel Iron Rod, 1x Primal Might, 1x Adamantite Rod
	{ from = 350, to = 351, spell = 32665, item = 22462, count = 1, reagents = { [22446] = 8, [22449] = 8, [22461] = 1, [23571] = 1, [25844] = 1 }, note = "Formula sold by Rungor (Terokkar) / Vodesiin (Hellfire)." },
	-- Enchant Cloak - Speed <- 6x Infinite Dust
	{ from = 351, to = 360, spell = 60609, count = 6, reagents = { [34054] = 6 } },
	-- Enchant Bracers - Striking <- 6x Infinite Dust
	{ from = 360, to = 375, spell = 60616, count = 10, reagents = { [34054] = 6 } },
	-- Runed Eternium Rod <- 6x Arcane Dust, 6x Greater Planar Essence, 1x Runed Adamantite Rod, 1x Eternium Rod
	{ from = 375, to = 376, spell = 32667, item = 22463, count = 1, reagents = { [22445] = 6, [22446] = 6, [22462] = 1, [25845] = 1 } },
	-- Enchant Bracers - Striking <- 6x Infinite Dust
	{ from = 376, to = 380, spell = 60616, count = 5, reagents = { [34054] = 6 } },
	-- Enchant Bracers - Exceptional Intellect <- 10x Infinite Dust
	{ from = 380, to = 385, spell = 44555, count = 5, reagents = { [34054] = 10 } },
	-- Enchant Boots - Icewalker <- 8x Infinite Dust, 1x Crystallized Water
	{ from = 385, to = 395, spell = 60623, count = 7, reagents = { [34054] = 8, [37705] = 1 } },
	-- Enchant Cloak - Superior Agility <- 9x Infinite Dust
	{ from = 395, to = 410, spell = 44500, count = 10, reagents = { [34054] = 9 } },
	-- Enchant Gloves - Expertise <- 12x Infinite Dust
	{ from = 410, to = 415, spell = 44484, count = 5, reagents = { [34054] = 12 } },
	-- Enchant Boots - Greater Spirit <- 10x Infinite Dust, 1x Greater Cosmic Essence
	{ from = 415, to = 420, spell = 44508, count = 5, reagents = { [34054] = 10, [34055] = 1 } },
	-- Enchant Shield - Defense <- 6x Infinite Dust, 6x Eternal Earth
	{ from = 420, to = 425, spell = 44489, count = 5, reagents = { [34054] = 6, [35624] = 6 } },
	-- Runed Titanium Rod <- 1x Runed Eternium Rod, 8x Dream Shard, 40x Infinite Dust, 12x Greater Cosmic Essence, 1x Titanium Rod
	{ from = 425, to = 426, spell = 60619, item = 44452, count = 1, reagents = { [22463] = 1, [34052] = 8, [34054] = 40, [34055] = 12, [41745] = 1 } },
	-- Enchant Shield - Defense <- 6x Infinite Dust, 6x Eternal Earth
	{ from = 426, to = 430, spell = 44489, count = 5, reagents = { [34054] = 6, [35624] = 6 } },
	-- Enchant Cloak - Mighty Armor <- 15x Infinite Dust, 2x Greater Cosmic Essence
	{ from = 430, to = 435, spell = 47672, count = 5, reagents = { [34054] = 15, [34055] = 2 }, note = "Formula sold by Vanessa Sellers in Dalaran (4 Dream Shard)." },
	-- Enchant Gloves - Armsman <- 2x Dream Shard, 8x Eternal Earth
	{ from = 435, to = 445, spell = 44625, count = 8, reagents = { [34052] = 2, [35624] = 8 }, note = "Formula sold by Vanessa Sellers in Dalaran (4 Dream Shard)." },
	-- Abyssal Shatter <- 1x Abyss Crystal
	{ from = 445, to = 450, spell = 69412, item = 206759, count = 8, reagents = { [34057] = 1 }, note = "Green from 448; easily reaches 450 while yielding valuable essences/dust." },
})
