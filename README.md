# NEON HEIST — Galactic Edition

A touch-first arcade endless runner built as a web game and Capacitor iOS project.

## Included in this source build
- Neon title screen, pilot profile, hangar/shop, 30 purchasable ship frames and local save.
- Endless runs, star pickups, Bits, sequential missions and +5 Bits per completed mission.
- +1 Bit per star collected during a run.
- Enemy drones (with visible attack tell), scouts, hunters, tanks, monsters and boss encounters.
- Boss weak-point windows; the ship auto-fires during runs and shots damage the boss only while its core is open. Defeat awards 25 bonus Bits.
- Five timed boosters are represented in the game logic: shield, magnet, slow, hyper-fire and cloak.
- 50 achievements with increasing reward tiers, sound effects and synthesized background music.
- Drag/touch-only movement. There are no left/right control buttons.
- Supabase email authentication and shared leaderboard integration, once configured.

## Run locally
Requires Node.js 20+.

```bash
npm install
cp config.example.js config.js
# edit config.js with Supabase project URL and anon key (optional for offline play)
npm run start
```

For a production web build: `npm run build`, then deploy the `dist/` folder to a static host with HTTPS. Configure your Supabase URL/key in `config.js` before building.

## Online accounts and global leaderboard
1. Create a Supabase project.
2. Open SQL Editor and run `supabase/schema.sql`.
3. In Project Settings → API, copy the Project URL and anon/publishable key into `config.js` (never use the service-role key in a client app).
4. Enable Email auth in Authentication → Providers. For quick testing, configure email confirmation to suit your test environment.
5. Rebuild/redeploy. Create an account from Account & Global Rank.

**Competitive-integrity warning:** this starter submits a score from the client. The SQL function checks authentication and bounds but cannot prove a score was earned legitimately. A public competitive leaderboard needs server-authoritative simulation or replay validation, rate limits, and anti-cheat before launch. Do not market this starter leaderboard as cheat-proof.

## iPhone App Store build
Requires macOS, Xcode, an Apple Developer account and signing access.

```bash
npm run build
npx cap add ios
npx cap sync ios
npx cap open ios
```
In Xcode, set the signing team and bundle ID, test on real iPhones, add app icons/screenshots/privacy details, archive, then submit through App Store Connect. Apple review and publication are external steps; this repository is not already published.

## Important scope notes
This is a newly assembled source implementation based on the requirements available in the conversation. It cannot merge hidden source code from an earlier prototype or migrate its local save automatically. The game is playable offline immediately; cloud accounts and rankings become active only after Supabase setup. The current game is a foundation release, not a finished, externally audited commercial launch.
