# Roblox Game Development

> Learn Lua and Roblox Studio from zero to advanced.
> Build any type of game: obbies, tycoons, simulators, RPGs, shooters, and open-world adventures.

---

## What This Repo Is

This is a complete Roblox game development course.
No fluff. No long videos. Every lesson is short and focused.
Every stage ends with a real playable game.

By the end, you will understand every system used in games like Blox Fruits, Adopt Me, Doors, and Jailbreak.

---

## Who This Is For

- Complete beginners who have never coded
- Roblox players who want to make their own games
- Developers who want to understand advanced Roblox systems

---

## Repo Structure

```text
01-lua-roblox/
│
├── README.md
├── ROADMAP.md
├── cheatsheet.md
│
├── stage-1-lua-basics/
│   ├── README.md
│   ├── 00-setup/
│   │   ├── README.md
│   │   ├── install-studio.md
│   │   ├── explorer-guide.md
│   │   └── properties-guide.md
│   ├── 01-basics/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── hello.lua
│   │   │   └── comments.lua
│   │   └── challenge.md
│   ├── 02-variables/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── variables.lua
│   │   │   ├── types.lua
│   │   │   └── constants.lua
│   │   └── challenge.md
│   ├── 03-strings/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── concat.lua
│   │   │   ├── format.lua
│   │   │   └── methods.lua
│   │   └── challenge.md
│   ├── 04-math/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── arithmetic.lua
│   │   │   ├── random.lua
│   │   │   └── math-functions.lua
│   │   └── challenge.md
│   ├── 05-conditionals/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── if-else.lua
│   │   │   ├── elseif.lua
│   │   │   └── logic-ops.lua
│   │   └── challenge.md
│   ├── 06-loops/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── for.lua
│   │   │   ├── while.lua
│   │   │   └── repeat.lua
│   │   └── challenge.md
│   ├── 07-functions/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── basic.lua
│   │   │   ├── params.lua
│   │   │   └── return.lua
│   │   └── challenge.md
│   ├── 08-tables/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── arrays.lua
│   │   │   ├── dicts.lua
│   │   │   └── nested.lua
│   │   └── challenge.md
│   ├── 09-metatables/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── basics.lua
│   │   │   ├── oop.lua
│   │   │   └── __index.lua
│   │   └── challenge.md
│   ├── 10-modules/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── module.lua
│   │   │   ├── require.lua
│   │   │   └── example.lua
│   │   └── challenge.md
│   └── 11-coroutines/
│       ├── README.md
│       ├── code/
│       │   ├── basics.lua
│       │   ├── spawn.lua
│       │   └── delay.lua
│       └── challenge.md
│
├── stage-2-roblox-systems/
│   ├── README.md
│   ├── 01-explorer-properties/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── find-part.lua
│   │   │   ├── change-color.lua
│   │   │   └── create-part.lua
│   │   └── challenge.md
│   ├── 02-workspace-parts/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── cframe.lua
│   │   │   ├── vector3.lua
│   │   │   └── movement.lua
│   │   └── challenge.md
│   ├── 03-events/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── touched.lua
│   │   │   ├── clicked.lua
│   │   │   └── changed.lua
│   │   └── challenge.md
│   ├── 04-remotes/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── remote-event.lua
│   │   │   ├── remote-function.lua
│   │   │   └── server-client.lua
│   │   └── challenge.md
│   ├── 05-gui-basics/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── screengui.lua
│   │   │   ├── frames.lua
│   │   │   └── buttons.lua
│   │   └── challenge.md
│   ├── 06-inventory-systems/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── add-item.lua
│   │   │   ├── remove-item.lua
│   │   │   └── ui-display.lua
│   │   └── challenge.md
│   ├── 07-tools-weapons/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── basic-tool.lua
│   │   │   ├── sword.lua
│   │   │   └── gun.lua
│   │   └── challenge.md
│   ├── 08-damage-health/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── damage.lua
│   │   │   ├── health.lua
│   │   │   └── respawn.lua
│   │   └── challenge.md
│   ├── 09-npc-ai/
│   │   ├── README.md
│   │   ├── code/
│   │   │   ├── pathfinding.lua
│   │   │   ├── states.lua
│   │   │   └── dialogue.lua
│   │   └── challenge.md
│   └── 10-data-persistence/
│       ├── README.md
│       ├── code/
│       │   ├── datastore.lua
│       │   ├── save.lua
│       │   └── load.lua
│       └── challenge.md
│
├── stage-3-core-systems/
│   ├── README.md
│   ├── 01-player-data/
│   ├── 02-inventory/
│   ├── 03-currency/
│   ├── 04-shop/
│   ├── 05-combat/
│   ├── 06-movement/
│   ├── 07-interactions/
│   ├── 08-npc-ai/
│   ├── 09-ui-gui/
│   ├── 10-leaderboard/
│   ├── 11-matchmaking/
│   └── 12-monetization/
│
├── stage-4-genres/
│   ├── README.md
│   ├── 01-obby/
│   ├── 02-tycoon/
│   ├── 03-simulator/
│   ├── 04-sword-fight/
│   ├── 05-pvp-arena/
│   ├── 06-rpg/
│   ├── 07-open-world/
│   ├── 08-shooter/
│   ├── 09-horror/
│   ├── 10-survival/
│   ├── 11-racing/
│   ├── 12-tower-defense/
│   ├── 13-battle-royale/
│   ├── 14-sandbox/
│   ├── 15-story-adventure/
│   ├── 16-social-hangout/
│   ├── 17-sports/
│   ├── 18-puzzle/
│   ├── 19-card-board/
│   └── 20-idle-clicker/
│
├── stage-5-mastery/
│   ├── README.md
│   ├── 01-optimization/
│   ├── 02-streaming/
│   ├── 03-advanced-physics/
│   ├── 04-networking/
│   ├── 05-anti-cheat/
│   ├── 06-shaders/
│   ├── 07-procedural-gen/
│   ├── 08-publishing/
│   ├── 09-marketing/
│   └── 10-live-ops/
│
├── projects/
│   ├── 01-obby/
│   ├── 02-sword-fight/
│   ├── 03-tycoon/
│   ├── 04-simulator/
│   ├── 05-pet-system/
│   ├── 06-pvp-arena/
│   ├── 07-devil-fruit-game/
│   ├── 08-combat-game/
│   ├── 09-quest-adventure/
│   ├── 10-boss-raid/
│   ├── 11-open-world-rpg/
│   ├── 12-vehicle-game/
│   ├── 13-shooter-game/
│   ├── 14-police-chase-game/
│   └── 15-full-multiplayer-game/
│
├── reference/
│   ├── roblox-api-cheatsheet.md
│   ├── services-list.md
│   ├── performance-tips.md
│   ├── security-guide.md
│   ├── publishing-guide.md
│   ├── free-assets.md
│   ├── plugins.md
│   └── communities.md
│
└── diagrams/
    ├── lua-variables.svg
    ├── lua-tables.svg
    ├── roblox-explorer.svg
    ├── roblox-remotes.svg
    ├── roblox-datastore.svg
    ├── game-loop.svg
    └── systems-map.svg
```

---

## How to Use This Repo

Every lesson folder contains:

- README.md - the lesson
- code/ - runnable Lua scripts
- challenge.md - your exercise

Every project folder contains:

- README.md - what you will build
- starter/ - boilerplate to begin
- solution.md - full step-by-step guide

---

## How to Learn Best

- Type the code yourself. Do not copy-paste.
- Break things. Change numbers, delete lines, see what happens.
- Google errors. Every developer does this.
- Build small games first. Do not try to make the next Blox Fruits on day one.

---

## Requirements

- Roblox Studio (free)
- A Roblox account (free)
- A computer to run Roblox Studio
- Patience

---

## Contributing

Found a bug? Have a better example? Pull requests are welcome.

---

---

## Star This Repo

If this helps you learn, drop a star. It helps others find it.
