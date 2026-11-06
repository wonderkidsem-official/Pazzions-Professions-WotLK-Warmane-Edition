-- Cooking leveling route 1-450 (WotLK 3.3.5a - Warmane Icecrown Optimized).
PazzionsProfessions:RegisterGuide("Cooking", {
	-- Spice Bread <- 1x Mild Spices, 1x Simple Flour
	{ from = 1, to = 40, spell = 37836, item = 30816, count = 20, reagents = { [2678] = 1, [30817] = 1 }, note = "Ingredients bought from Cooking / General Goods vendors." },
	-- Spiced Wolf Meat <- 1x Stringy Wolf Meat
	{ from = 40, to = 65, spell = 2539, item = 2680, count = 12, reagents = { [2672] = 1 }, note = "Or Roasted Boar Meat, Smoked Bear Meat, Brilliant Smallfish, Slitherskin Mackerel." },
	-- Boiled Clams <- 1x Refreshing Spring Water, 1x Clam Meat
	{ from = 65, to = 110, spell = 6499, item = 5525, count = 18, reagents = { [159] = 1, [5503] = 1 }, note = "Or Coyote Steak, Longjaw Mud Snapper, Bat Bites, Strider Stew." },
	-- Crab Cake <- 1x Crawler Meat
	{ from = 110, to = 130, spell = 2544, item = 2683, count = 10, reagents = { [2674] = 1 }, note = "Or Dry Pork Ribs, Bristle Whisker Catfish, Cooked Crab Claw." },
	-- Curiously Tasty Omelet <- 1x Raptor Egg
	{ from = 130, to = 175, spell = 3376, item = 3665, count = 18, reagents = { [3685] = 1 }, note = "Recipe sold by Kendor Kabonka (Stormwind) / Keena (Arathi Highlands)." },
	-- Roast Raptor <- 1x Raptor Flesh
	{ from = 175, to = 225, spell = 15855, item = 12210, count = 18, reagents = { [12184] = 1 }, note = "Recipe sold by Hammon Karwn / Keena in Arathi Highlands." },
	-- Undermine Clam Chowder <- 2x Zesty Clam Meat
	{ from = 225, to = 250, spell = 20626, item = 16766, count = 10, reagents = { [7974] = 2 }, note = "Or Spotted Yellowtail, Monster Omelet, Tender Wolf Steak." },
	-- Juicy Bear Burger <- 1x Bear Flank
	{ from = 250, to = 285, spell = 46688, item = 35565, count = 14, reagents = { [35562] = 1 }, note = "Or Poached Sunscale Salmon, Nightfin Soup." },
	-- Smoked Desert Dumplings <- 1x Sandworm Meat
	{ from = 285, to = 300, spell = 24801, item = 20452, count = 6, reagents = { [20424] = 1 }, note = "Or Baked Salmon, Lobster Stew." },
	-- Ravager Dog <- 1x Ravager Flesh
	{ from = 300, to = 325, spell = 33284, item = 27655, count = 10, reagents = { [27674] = 1 }, note = "Recipe sold by Sid Limbardi (Alliance) / Cookie One-Eye (Horde) in Hellfire Peninsula." },
	-- Talbuk Steak <- 1x Talbuk Venison
	{ from = 325, to = 350, spell = 33289, item = 27660, count = 12, reagents = { [27682] = 1 }, note = "Or Roasted Clefthoof, Warp Burger." },
	-- Northern Stew <- 1x Chilled Meat
	{ from = 350, to = 365, spell = 57421, item = 34747, count = 15, reagents = { [43013] = 1 }, note = "Recipe from Northern Cooking quest in Howling Fjord / Borean Tundra." },
	-- Rhino Dogs <- 1x Rhino Meat
	{ from = 365, to = 400, spell = 45553, item = 34752, count = 35, reagents = { [43012] = 1 }, note = "Or Worm Delight, Shoveltusk Steak, Roasted Worg, Pickled Fangtooth." },
	-- Hearty Rhino <- 1x Northern Spices, 1x Rhino Meat
	{ from = 400, to = 450, spell = 57436, item = 42995, count = 45, reagents = { [43007] = 1, [43012] = 1 }, note = "Recipes cost Epicurean's Awards from Dalaran cooking dailies. Pick whichever meat is cheapest." },
})
