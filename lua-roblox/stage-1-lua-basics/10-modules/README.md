
# 10 - Modules

In this lesson you will learn how to split your code into separate files.

You will learn:

- What a ModuleScript is
- Why modules matter
- How to create one
- How to `require` it
- How to share data between scripts
- Common module patterns

Modules are how real Roblox projects are organized.
Every large game is built from hundreds of modules.

---

## What Is a Module

A module is a file that returns something.

Usually it returns a table full of functions.

Other scripts can `require` the module and use those functions.

Think of a module as a toolbox.
The tools inside are functions.
Other scripts open the toolbox and use what they need.

---

## Why Modules Matter

Without modules, everything lives in one script.

```lua
-- One giant script with 2000 lines
local function calculateDamage() ... end
local function healPlayer() ... end
local function spawnEnemy() ... end
local function saveData() ... end
-- ... and 500 more functions
```

With modules, each file has one job.

```text
Scripts/
  Main.server.lua         -- runs the game
  DamageModule.lua        -- damage calculations
  HealModule.lua          -- healing
  EnemyModule.lua         -- enemy logic
  DataModule.lua          -- saving and loading
```

Readable. Testable. Reusable.

---

## Creating a Module

In Roblox Studio:

1. Right-click `ReplicatedStorage`
2. Insert Object
3. ModuleScript

It appears with a default template.

```lua
local module = {}

return module
```

This is the smallest valid module.
It returns an empty table.

---

## Adding Functions

```lua
local Utils = {}

function Utils.add(a, b)
    return a + b
end

function Utils.subtract(a, b)
    return a - b
end

function Utils.double(n)
    return n * 2
end

return Utils
```

Save this as a ModuleScript called `Utils`.

---

## Requiring a Module

From another script:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))

print(Utils.add(2, 3))          -- 5
print(Utils.double(5))          -- 10
print(Utils.subtract(10, 4))    -- 6
```

`require` runs the module once and returns whatever it returns.

After the first require, the same table is returned every time.

---

## Modules Run Once

A module runs when it is first required.
Every require after that returns the cached result.

```lua
-- Counter.lua
print("Module loaded")
return {value = 0}
```

```lua
-- Script 1
local Counter = require(Counter)
-- prints "Module loaded"

-- Script 2
local Counter = require(Counter)
-- does not print again, uses cached table
```

This means modules can hold shared state.

---

## Shared State

```lua
-- PlayerData.lua
local PlayerData = {}

PlayerData.players = {}

function PlayerData.addPlayer(name)
    PlayerData.players[name] = {coins = 0, level = 1}
end

function PlayerData.getPlayer(name)
    return PlayerData.players[name]
end

return PlayerData
```

Every script that requires `PlayerData` sees the same table.
One script can add a player. Another script can read it.

---

## Where to Put Modules

| Location | Use For |
|----------|---------|
| ReplicatedStorage | Shared with server and client |
| ServerStorage | Server only, more secure |
| ServerScriptService | Server modules used with server scripts |
| StarterPlayerScripts | Client modules |

For most beginner code, put modules in `ReplicatedStorage`.

---

## A Damage Module Example

```lua
-- DamageModule.lua
local DamageModule = {}

function DamageModule.calculate(base, multiplier, defense)
    local raw = base * multiplier
    local final = raw - defense
    if final < 0 then
        final = 0
    end
    return final
end

function DamageModule.apply(character, amount)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid:TakeDamage(amount)
    end
end

return DamageModule
```

Use it from a script:

```lua
local DamageModule = require(ReplicatedStorage:WaitForChild("DamageModule"))

local damage = DamageModule.calculate(20, 1.5, 5)
print("Damage: " .. damage)
```

---

## A Utility Module Example

```lua
-- Utils.lua
local Utils = {}

function Utils.round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

function Utils.clamp(value, minValue, maxValue)
    return math.max(minValue, math.min(value, maxValue))
end

function Utils.formatNumber(n)
    local s = tostring(n)
    local result = ""
    while #s > 3 do
        result = "," .. s:sub(-3) .. result
        s = s:sub(1, -4)
    end
    return s .. result
end

return Utils
```

```lua
print(Utils.round(3.14159, 2))     -- 3.14
print(Utils.clamp(15, 0, 10))      -- 10
print(Utils.formatNumber(1234567)) -- 1,234,567
```

---

## A Config Module Example

```lua
-- Config.lua
local Config = {}

Config.GAME_NAME = "Code Forge"
Config.MAX_PLAYERS = 12
Config.ROUND_TIME = 300
Config.STARTING_COINS = 0
Config.MAX_HEALTH = 100

Config.DIFFICULTIES = {
    easy = {enemyHealth = 50, enemyDamage = 5},
    normal = {enemyHealth = 100, enemyDamage = 10},
    hard = {enemyHealth = 200, enemyDamage = 20}
}

return Config
```

Any script can read these values.

```lua
local Config = require(ReplicatedStorage:WaitForChild("Config"))

print(Config.GAME_NAME)
print(Config.DIFFICULTIES.hard.enemyDamage)
```

Change the value in one place. Every script sees the new value.

---

## A Class Module Example

```lua
-- Player.lua
local Player = {}
Player.__index = Player

function Player.new(name, level)
    local self = setmetatable({}, Player)
    self.name = name
    self.level = level
    self.health = 100
    return self
end

function Player:takeDamage(amount)
    self.health = self.health - amount
    if self.health < 0 then
        self.health = 0
    end
end

function Player:isAlive()
    return self.health > 0
end

return Player
```

```lua
local Player = require(ReplicatedStorage:WaitForChild("Player"))

local alex = Player.new("Alex", 5)
alex:takeDamage(30)
print(alex:isAlive())     -- true
```

---

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Module file | PascalCase | `DamageModule` |
| Module variable | Same as file | `local DamageModule = {}` |
| Functions | camelCase | `calculateDamage` |
| Constants | ALL CAPS | `MAX_HEALTH` |

Stick to these. Everyone in the Roblox community uses them.

---

## Requiring from Different Locations

```lua
-- From ReplicatedStorage
local Mod = require(game.ReplicatedStorage:WaitForChild("Mod"))

-- From ServerStorage
local Mod = require(game.ServerStorage:WaitForChild("Mod"))

-- From ServerScriptService
local Mod = require(game.ServerScriptService:WaitForChild("Mod"))

-- From a sibling folder
local Mod = require(script.Parent:WaitForChild("Mod"))
```

Always use `WaitForChild` when requiring.
It prevents errors if the module is not loaded yet.

---

## Debugging Modules

If a module errors, the whole script that requires it errors.

Print inside the module to confirm it runs:

```lua
print("Utils module loaded")

local Utils = {}
-- ...

return Utils
```

If you do not see the print, the module was not required.

If you see it twice, you required it from two places before caching.

---

## Common Mistakes

Mistake 1: Forgetting to return.

```lua
local Utils = {}
-- forgot return Utils
```

Result: `require` returns nil.

Mistake 2: Requiring the wrong type.

```lua
require(script)     -- ERROR, script is not a ModuleScript
```

Only ModuleScripts can be required.

Mistake 3: Requiring a module that is still loading.

Use `WaitForChild`.

Mistake 4: Requiring a server module from the client.

If the module is in `ServerStorage`, the client cannot see it.

Mistake 5: Changing a module while a script uses it.

The change takes effect on the next run.

Mistake 6: Calling `require` at the top of a module that requires the current script.

This causes a loop error.

---

## A Project Structure Example

```text
ReplicatedStorage/
  Modules/
    Config.lua
    Utils.lua
    Player.lua
    Enemy.lua
    Inventory.lua

ServerScriptService/
  Main.server.lua
  Combat.server.lua
  Data.server.lua

StarterPlayer/
  StarterPlayerScripts/
    UIController.client.lua
    InputController.client.lua
```

This is how real games are organized.

---

## Practice

Open Roblox Studio.

1. In ReplicatedStorage, insert a ModuleScript
2. Name it `MathUtils`
3. Write:

```lua
local MathUtils = {}

function MathUtils.add(a, b)
    return a + b
end

function MathUtils.multiply(a, b)
    return a * b
end

return MathUtils
```

4. In ServerScriptService, insert a Script
5. Write:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MathUtils = require(ReplicatedStorage:WaitForChild("MathUtils"))

print(MathUtils.add(2, 3))
print(MathUtils.multiply(4, 5))
```

6. Press F5
7. Check the Output window

You should see:

```text
5
20
```

Now add more functions to the module.
Use them from the script.

---

## Summary

- A module is a file that returns a value
- Usually it returns a table of functions
- Use `require` to load a module
- Modules run once, then are cached
- Modules can hold shared state
- Put shared modules in ReplicatedStorage
- Put server-only modules in ServerStorage
- Use `WaitForChild` when requiring
- Use PascalCase for module names
- Break big scripts into small modules

Modules are how you keep your code clean.
Every project you build from now on will use them.

---

## Files in This Lesson

- [code/module.lua](code/module.lua) - creating a module
- [code/require.lua](code/require.lua) - requiring a module
- [code/example.lua](code/example.lua) - a real example
- [challenge.md](challenge.md) - your exercise

---

Next: [code/module.md](code/module.md)
