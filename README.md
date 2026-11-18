# NEON HEIST — Galactic Edition (v1.2)

A touch-first neon arcade survival game for mobile browsers and a future Capacitor iOS build.

## Version 1.2 changes
- Slower, more forgiving gameplay: world movement is reduced, spawns are less frequent, projectiles are slower, and boss attacks have longer gaps.
- Health bars above enemies and a dedicated boss health bar.
- Live mid-run booster panel with effect descriptions, countdowns and progress bars.
- New Booster Lab with permanent Duration and Power upgrades for all five boosters. Each upgrade path has five levels and costs Bits.
- Ship skins sharing the same shape now share the same price.
- Local save migration supports v6, v5 and v4 saves.

## Existing game features
- 30 ships, ship hangar, Bits and 50 achievements.
- Endless one-hit survival gameplay with touch-and-drag controls.
- Missions: +5 Bits per completed mission; each collected star awards +1 Bit.
- Drones, scouts, hunters, tanks, monsters and boss fights.
- Five boosters: shield, magnet, slow, hyper-fire and cloak.
- Generated music and sound effects.
- Supabase email registration/sign-in and shared leaderboard integration after configuration.

## Publish on GitHub Pages
Upload/replace `index.html` and `game.js` in the repository root. Keep your existing `config.js` so you do not overwrite your Supabase settings. `manifest.webmanifest` is unchanged. Commit the files and wait for GitHub Pages to deploy.

## Supabase setup
The game still requires your own Supabase project URL and public anon/publishable key in `config.js`, plus the SQL schema run in the Supabase SQL Editor. Never put a `service_role` key in browser code. Email confirmation settings and allowed redirect URLs must be configured in Supabase Authentication.

## Test notes
JavaScript syntax was checked with Node.js. HTML IDs were checked for duplicates and against JavaScript references. A full real-device iPhone test and live Supabase test have not been performed here.

## iPhone
Open the deployed HTTPS URL in Safari → Share → Add to Home Screen. This creates a home-screen web app shortcut, not an App Store installation.
