
# __index.lua

The `__index` metamethod in Lua.

`__index` is the most important metamethod in Lua.
It is how inheritance and object oriented code work.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Basic Idea

When you look up a key in a table that does not exist, Lua checks the metatable's `__index`.

```lua
local defaults = {health = 100, mana = 50}
local player = setmetatable({}, {__index = defaults})

print(player.health)     -- 100
print(player.mana)       -- 50
print(player.speed)      -- nil
```

The `player` table is empty.
But Lua finds `health` and `mana` in `defaults`.

---

## What Happens Step by Step

When you write `player.health`, Lua:

1. Looks in `player` for `health`. Not found.
2. Looks in `player`'s metatable for `__index`.
3. `__index` is `defaults`.
4. Looks in `defaults` for `health`. Found. Returns 100.

---

## __index as a Table

You can set `__index` to a table.

```lua
local defaults = {health = 100, mana = 50}
local player = setmetatable({}, {__index = defaults})

print(player.health)     -- 100
```

---

## __index as a Function

You can also set `__index` to a function.
Lua calls the function when the key is missing.

```lua
local player = setmetatable({}, {
    __index = function(table, key)
        print("Looked up missing key: " .. key)
        return "default"
    end
})

print(player.health)
```

Output:

```text
Looked up missing key: health
default
```

The function gets the table and the key as arguments.

---

## Overriding __index Values

If the table has the key itself, `__index` is not used.

```lua
local defaults = {health = 100}
local player = setmetatable({health = 50}, {__index = defaults})

print(player.health)     -- 50, uses the instance value
```

The instance value wins.

---

## Changing the Instance

You can add new keys to the instance.

```lua
local defaults = {health = 100}
local player = setmetatable({}, {__index = defaults})

print(player.health)     -- 100
print(player.mana)       -- nil

player.mana = 50
print(player.mana)       -- 50
```

Once you set a key on the instance, that value is used.

---

## The Inheritance Chain

`__index` can point to another table with its own `__index`.
This creates a chain.

```lua
local base = {name = "base"}
local middle = setmetatable({}, {__index = base})
local top = setmetatable({}, {__index = middle})

print(top.name)     -- base
```

Lua walks up the chain until it finds the key or runs out.

---

## Setting Up a Class

The standard class pattern:

```lua
local Player = {}
Player.__index = Player

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end

function Player:speak()
    print("Hi, I am " .. self.name)
end

local alex = Player.new("Alex")
alex:speak()     -- Hi, I am Alex
```

The key line is:

```lua
Player.__index = Player
```

This makes new instances look up methods in `Player`.

---

## Why Player.__index = Player

Without this line, `alex:speak()` would fail.
Because `alex` does not have a `speak` key.

With this line, Lua looks for `speak` in `Player` and finds it.

```lua
local Player = {}
-- Player.__index = Player   -- missing!

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end

function Player:speak()
    print("Hi")
end

local alex = Player.new("Alex")
alex:speak()     -- ERROR, speak is not a function
```

Always set `__index` to the class.

---

## A Live Example

```lua
local Vehicle = {}
Vehicle.__index = Vehicle

function Vehicle.new(name, speed)
    local self = setmetatable({}, Vehicle)
    self.name = name
    self.speed = speed
    return self
end

function Vehicle:describe()
    print(self.name .. " moves at " .. self.speed .. " km/h")
end

local car = Vehicle.new("Car", 100)
local bike = Vehicle.new("Bike", 20)

car:describe()
bike:describe()
```

Output:

```text
Car moves at 100 km/h
Bike moves at 20 km/h
```

Each instance has its own `name` and `speed`.
They share the `describe` method.

---

## Memory Savings

`__index` saves memory.

Without it, every instance would copy every method.

```lua
-- Bad: each instance has its own copy
local alex = {speak = function() ... end, takeDamage = function() ... end}
local bob = {speak = function() ... end, takeDamage = function() ... end}
```

With `__index`, all instances share the same methods.

```lua
-- Good: instances share methods
local Player = {}
Player.__index = Player
function Player:speak() ... end
function Player:takeDamage() ... end

local alex = setmetatable({}, Player)
local bob = setmetatable({}, Player)
```

This matters when you have thousands of players.

---

## Common Mistakes

Mistake: Forgetting `__index`.

```lua
local Player = {}
-- missing Player.__index = Player
```

Result: methods are not found.

Mistake: Setting `__index` to the wrong table.

```lua
Player.__index = SomeOtherTable     -- wrong
```

Mistake: Using `__index` as a plain key name.

It must be the exact string `"__index"`.

Mistake: Confusing `__index` (metamethod) with `index` (regular key).

Only `__index` is special.

Mistake: Setting `__index` after creating instances.

Lua reads `__index` at lookup time, so it needs to be set before use.

---

## Summary

- `__index` is looked up when a key is missing
- It can be a table or a function
- Instance values override `__index`
- `__index` enables inheritance
- The class pattern uses `Class.__index = Class`
- All instances share methods through `__index`
- It saves memory compared to copying methods
