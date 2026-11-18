# NEON HEIST — Version 1.2

## Gameplay balance
- Reduced world movement speed by 20%.
- Slowed star and enemy movement, increased spawn intervals, and reduced projectile speeds.
- Boss encounters now begin less frequently and their attack volleys have longer gaps.
- Capped frame delta at 25ms for more stable updates after frame stalls.

## Enemy health
- Added individual health bars above regular enemies with color changes as health decreases.
- Added a dedicated boss health bar in the HUD.
- Increased tank and monster durability so their visual health bars are meaningful.

## Booster HUD
- Added a live side panel listing active boosters, explaining each effect and showing a countdown/progress bar.
- Shield status also shows remaining hit charges.

## Booster Lab
- Added a permanent Booster Lab purchase screen.
- Each of the five boosters has Duration and Power upgrade paths, each with five levels.
- Duration upgrades add 20% per level.
- Power upgrades improve the booster-specific effect: shield hit charges, magnet radius, time dilation, hyper-fire rate, or cloak duration.
- Purchases use Bits and are saved locally.

## Ship pricing
- Ship prices are now based on shape class. All five skins sharing a shape have the same listed price.

## Save compatibility
- Save namespace updated to v7.
- Existing v6, v5 and v4 local saves are read and migrated without deleting the older save keys.

## Test notes
- JavaScript syntax checked with Node.js.
- Checked HTML IDs for duplicates and verified all JavaScript-referenced UI IDs exist.
- A full real-device iPhone test and live Supabase test have not been performed in this environment.
