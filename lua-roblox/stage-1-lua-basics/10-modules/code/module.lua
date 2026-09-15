# module.lua

Creating a ModuleScript in Roblox.

A module is a file that returns something.
Usually it returns a table full of functions.
Other scripts can require it and use those functions.

This is a reference file. Copy the code into a ModuleScript inside Roblox Studio.
Put the ModuleScript in ReplicatedStorage.

---

## Creating a ModuleScript

In Roblox Studio:

1. Right-click ReplicatedStorage
2. Insert Object
3. ModuleScript

It appears with this default content:

```lua
local module = {}

return module
```

This is the smallest valid module.
It returns an empty table.

---

## Naming the Module

Rename it to something descriptive.

Good names:

- `Utils`
- `DamageModule`
- `PlayerData`
- `Config`
- `Inventory`

Bad names:

- `Module1`
- `Script2`
- `thing`
- `a`

Use PascalCase for module names.

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

Each function is stored as a key in the table.
The keys become the function names.

---

## Why the Pattern `local Utils = {}`

You start with an empty table.
You add functions to it.
You return it at the end.

```lua
local Utils = {}     -- create the table

function Utils.add(a, b)     -- add a function
    return a + b
end

return Utils         -- send the table back
```

Any script that requires this module gets the same table.

---

## Adding Constants

Modules can hold values, not just functions.

```lua
local Config = {}

Config.GAME_NAME = "Code Forge"
Config.MAX_PLAYERS = 12
Config.ROUND_TIME = 300
Config.MAX_HEALTH = 100
Config.STARTING_COINS = 0

return Config
```

Any script can read these values.

```lua
local Config = require(ReplicatedStorage:WaitForChild("Config"))

print(Config.GAME_NAME)
print(Config.MAX_HEALTH)
```

---

## Adding Both

You can mix constants and functions.

```lua
local MathUtils = {}

MathUtils.PI = 3.1415926535898
MathUtils.E = 2.7182818284590

function MathUtils.circleArea(radius)
    return MathUtils.PI * radius * radius
end

function MathUtils.round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

return MathUtils
```

---

## A Shared State Module

Modules can hold state that multiple scripts share.

```lua
local Counter = {}

Counter.value = 0

function Counter.increment()
    Counter.value = Counter.value + 1
    return Counter.value
end

function Counter.decrement()
    Counter.value = Counter.value - 1
    return Counter.value
end

function Counter.reset()
    Counter.value = 0
end

return Counter
```

Every script that requires this module sees the same counter.

---

## A Class Module

A module can return a class.

```lua
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

Other scripts can require it and create instances.

```lua
local Player = require(ReplicatedStorage:WaitForChild("Player"))

local alex = Player.new("Alex", 5)
alex:takeDamage(30)
print(alex:isAlive())     -- true
```

---

## A Module with Private Functions

You can have functions that are not exposed.

```lua
local Utils = {}

-- Private function. Not added to the table.
local function validateNumber(n)
    return type(n) == "number"
end

-- Public function.
function Utils.add(a, b)
    if not validateNumber(a) or not validateNumber(b) then
        return nil
    end
    return a + b
end

return Utils
```

Other scripts cannot call `validateNumber`.
They can only call `Utils.add`.

This is how you keep internal logic hidden.

---

## A Module That Requires Another Module

Modules can require other modules.

```lua
-- DamageModule.lua
local Config = require(script.Parent:WaitForChild("Config"))

local DamageModule = {}

function DamageModule.calculate(base, multiplier, defense)
    local raw = base * multiplier
    local final = raw - defense
    if final < 0 then
        final = 0
    end
    return final
end

function DamageModule.defaultDamage()
    return Config.DIFFICULTIES.normal.enemyDamage
end

return DamageModule
```

The `script.Parent` refers to the folder containing both modules.

---

## A Module That Runs Code on Load

A module can also run code when it is first required.

```lua
print("Utils module loaded")

local Utils = {}

function Utils.add(a, b)
    return a + b
end

return Utils
```

The print runs once, when the module is first required.

Every require after that does not re-run the module.

---

## A Real Example: String Module

```lua
local StringUtils = {}

function StringUtils.capitalize(text)
    return text:sub(1, 1):upper() .. text:sub(2):lower()
end

function StringUtils.repeatString(text, n)
    local result = ""
    for i = 1, n do
        result = result .. text
    end
    return result
end

function StringUtils.trim(text)
    return text:match("^%s*(.-)%s*$")
end

function StringUtils.reverse(text)
    return string.reverse(text)
end

return StringUtils
```

Use it:

```lua
local StringUtils = require(ReplicatedStorage:WaitForChild("StringUtils"))

print(StringUtils.capitalize("hello"))         -- Hello
print(StringUtils.repeatString("ab", 3))       -- ababab
print(StringUtils.trim("  hi  "))              -- hi
print(StringUtils.reverse("Roblox"))           -- xolboR
```

---

## A Real Example: Inventory Module

```lua
local Inventory = {}
Inventory.__index = Inventory

function Inventory.new()
    local self = setmetatable({}, Inventory)
    self.items = {}
    return self
end

function Inventory:add(item)
    table.insert(self.items, item)
end

function Inventory:remove(item)
    for i, v in ipairs(self.items) do
        if v == item then
            table.remove(self.items, i)
            return true
        end
    end
    return false
end

function Inventory:has(item)
    for _, v in ipairs(self.items) do
        if v == item then
            return true
        end
    end
    return false
end

function Inventory:list()
    for i, item in ipairs(self.items) do
        print(i, item)
    end
end

return Inventory
```

Use it:

```lua
local Inventory = require(ReplicatedStorage:WaitForChild("Inventory"))

local bag = Inventory.new()
bag:add("sword")
bag:add("shield")
bag:add("potion")

bag:list()
print(bag:has("sword"))     -- true
bag:remove("shield")
bag:list()
```

---

## Common Mistakes

Mistake 1: Forgetting `return`.

```lua
local Utils = {}
function Utils.add(a, b) return a + b end
-- forgot return Utils
```

Result: require returns nil.

Mistake 2: Returning the wrong thing.

```lua
return Utils.add     -- returns just the function, not the table
return Utils         -- returns the whole table
```

Mistake 3: Creating the table with the wrong name.

```lua
local utils = {}
function Utils.add(a, b)     -- ERROR, Utils is not defined
```

The table name must match.

Mistake 4: Forgetting `local` on the table.

```lua
Utils = {}     -- global, not recommended
```

Use `local` for all module tables.

Mistake 5: Running code at the top that requires another module, creating a loop.

Module A requires Module B, Module B requires Module A.
Lua cannot resolve the loop. Error.

---

## Summary

- A module is a ModuleScript that returns a value
- Usually it returns a table of functions
- Start with `local Name = {}`
- Add functions and constants to the table
- End with `return Name`
- Modules run once, then are cached
- Modules can hold shared state
- Modules can require other modules
- Private functions stay inside the module
- Use PascalCase for module names
