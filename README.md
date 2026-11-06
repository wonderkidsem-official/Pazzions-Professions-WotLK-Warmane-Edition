# Pazzion's Professions - Warmane Icecrown Edition (WotLK 3.3.5a)

[![World of Warcraft: Wrath of the Lich King](https://img.shields.io/badge/WoW-3.3.5a%20(12340)-blue.svg)](https://github.com/wonderkidsem-official/Pazzions-Professions-WotLK-Warmane-Edition)
[![Platform: Warmane Icecrown (3x)](https://img.shields.io/badge/Realm-Warmane%20Icecrown%20(3x)-orange.svg)](https://www.warmane.com/)
[![TSM 2.8.3 Compatible](https://img.shields.io/badge/TSM-2.8.3%20Compatible-green.svg)](https://github.com/wonderkidsem-official/Pazzions-TradeSkillMaster-2-WotLK-Warmane-Edition)
[![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE.txt)

**Pazzion's Professions** is a comprehensive, all-in-one profession companion and 1-450 leveling guide addon built specifically for **World of Warcraft 3.3.5a (Wrath of the Lich King)** on private servers, with specialized architecture and route optimizations for **Warmane Icecrown (3x skill-up realm mechanics)**.

It provides end-to-end leveling routes from 1 to 450 for all 14 professions, an intelligent raw-materials shopping list, an interactive HUD mini-guide, a live item tracker with bag/bank/mail scanning, and seamless 1-click **TradeSkillMaster (TSM 2.8.3)** / native Auction House integration.

---

## Key Features & Warmane Icecrown Optimizations

### 1. Warmane Icecrown 3x Rate Scaling
On realms that grant 3 skill points per craft (such as Warmane Icecrown), craft counts and material requirements are automatically scaled down by 3. You never waste gold buying 300 items when 100 is enough. Automatically detected on Icecrown/Warmane realms and configurable via Settings.

### 2. Smart Piecewise RNG Safety Buffer
Unlike conventional guides that assume a flat 100% success rate:
- **Orange recipes (100% success):** Strict minimum crafts required. No extra gold wasted.
- **Yellow recipes (~60% success):** +50% crafts buffer plus +1 extra craft margin to absorb bad-luck streaks.
- **Green recipes (~25% success):** +150% crafts buffer plus +2 extra craft margins.
- **Piecewise calculation:** If a recipe starts orange at 375 and turns yellow at 380, the engine slices the remaining points into their respective difficulty brackets so you never run out of materials midway through a tier.

### 3. Recursive Raw Materials Engine (`IntermediateReagents.lua`)
Most high-level recipes require intermediate components (e.g. *Handful of Cobalt Bolts, Heavy Blasting Powder, Mithril Casing, Solid Grinding Stone, Thorium Widget, Delicate Copper Wire, Inks, Cured Hides, Bolts of Frostweave*).
- Pazzion's Professions automatically resolves all intermediate crafts recursively into **true raw trade goods** (Ores, Bars, Stones, Cloths, Leathers, and Pigments).
- Automatically subtracts items already sitting in your bags, personal bank, guild bank, or mailbox.
- Understands multi-yield crafts (e.g. *Elemental Blasting Powder* yields 4, *Cobalt Bolts* yield 2, *Volatile Blasting Trigger* yields 2).

### 4. Flawless TradeSkillMaster (TSM 2.8.3) & Native AH 1-Click Search
- **Left-Click any missing material** in the Shopping tab or Item Tracker to immediately perform an auction search.
- When **TradeSkillMaster 2.8.3** (`TradeSkillMaster_Shopping` / `TradeSkillMaster_AuctionDB`) is loaded, it triggers an instant TSM Shopping search.
- If TSM is not present, it seamlessly falls back to the native Blizzard Auction House browse tab with automatic search execution and zero Lua errors.

### 5. 100% Trainer-Taught Routes (No Missing Recipe Blockers)
Extensively audited against WotLK 3.3.5a databases to eliminate blockers:
- **Engineering:** Replaced *Bladed Pickaxe* (which required skill 375 but was erroneously placed at 370) with *Volatile Blasting Trigger* (learned at 350, yields 2 per craft, feeds directly into *Explosive Decoys*). Fixed *Elemental Blasting Powder* to correctly use Motes of Fire & Earth. Fixed *Overcharged Capacitor* to use *Crystallized Earth* (37700), not Fire (37701).
- **Blacksmithing:** Replaced *Mithril Spurs* (a rare world drop pattern) with the 100% trainer-taught *Mithril Coif* (spell 9954). Fixed *Deadly Saronite Dirk* to require *Crystallized Air* (37702), not Earth (37700).
- **Jewelcrafting:** Fixed *Bloodstone Band* to require *Crystallized Earth* (37700), not Fire (37701).
- **Tailoring & Leatherworking:** Optimized bolt and leather conversion thresholds to provide skill-ups while stockpiling materials needed for subsequent gear recipes.

### 6. Interactive Mini-Guide & Live Item Tracker
- **Mini-Guide:** Sleek HUD anchored to your tradeskill window showing your current route step, remaining crafts, live material count (Have / Need), and difficulty color.
- **Item Tracker:** Add material goals with a single click or Shift-click any item into the HUD. Displays progress bars, increments/decrements (+/-), and plays audio cues with chat announcements upon completion.

### 7. Gold Making & Material Wealth Overview
- **Gold Tab:** Compares recipe crafting cost against live AH market prices (deducting the 5% AH cut) and vendor values to show the most profitable crafts.
- **Materials Tab:** Aggregates everything your characters hold across bags, bank, and mail, with total AH worth and character breakdown.
- **Cooldowns Tab:** Tracks profession cooldowns across all alts (Northrend Alchemy Research, Transmutes, Titansteel, Glacial Bag, Moonshroud, Spellcloth, Ebonweave) with login alerts when ready.

---

## Professions Covered (1-450)

| Category | Professions |
| :--- | :--- |
| **Primary Crafting** | Alchemy, Blacksmithing, Enchanting, Engineering, Inscription, Jewelcrafting, Leatherworking, Tailoring |
| **Primary Gathering** | Herbalism, Mining, Skinning |
| **Secondary Skills** | Cooking, First Aid, Fishing |

---

## Slash Commands

| Command | Action |
| :--- | :--- |
| `/pp` or `/pazzion` | Toggle the main window |
| `/pp guides` | Open Leveling Guides tab |
| `/pp shop` | Open Shopping List tab |
| `/pp mats` | Open Account Materials tab |
| `/pp gold` | Open Gold & Profit tab |
| `/pp cd` | Open Cooldowns tab |
| `/pp alts` | Open Characters & Alts tab |
| `/pp track` | Toggle Item Tracker HUD |
| `/pp mini` | Toggle Profession Mini-Guide HUD |
| `/pp scan` | Scan AH prices (with AH window open) |
| `/jp` | Legacy alias (all `/pp` commands work with `/jp`) |

---

## Installation

1. Download the latest release from the [Releases](https://github.com/wonderkidsem-official/Pazzions-Professions-WotLK-Warmane-Edition/releases) page.
2. Extract the archive into your World of Warcraft directory:
   ```
   World of Warcraft\Interface\AddOns\PazzionsProfessions\
   ```
   *(Ensure the folder name is exactly `PazzionsProfessions` and contains `PazzionsProfessions.toc` directly inside it).*
3. Launch or restart World of Warcraft 3.3.5a, ensure `Pazzion's Professions` is checked in the character screen **AddOns** list, and enable *"Load out of date AddOns"*.

---

## Recommended Companion Addons

- **[Pazzion's TradeSkillMaster 2 (Warmane Edition)](https://github.com/wonderkidsem-official/Pazzions-TradeSkillMaster-2-WotLK-Warmane-Edition)** - Heavily optimized TSM 2.8.3 suite for Warmane high-population auction houses.
- **[Pazzion's LuaBoost WotLK](https://github.com/wonderkidsem-official/Pazzions-LuaBoost-WotLK)** - High-performance Lua garbage collection optimizer and UI thrashing protector for WoW 3.3.5a.
- **[Pazzion's WotLK BiS List AtlasLoot Enhanced](https://github.com/wonderkidsem-official/Pazzions-WotLK-BiS-List-AtlasLoot-Enhanced-v5.11.04)** - Best-in-Slot lists integrated directly into AtlasLoot for all classes and raid tiers.

---

## Credits & License

* Developed and optimized by **Pazzion** for the Warmane community.
* Core leveling routes inspired by classic WotLK profession guides.
* Released under the **MIT License**.
