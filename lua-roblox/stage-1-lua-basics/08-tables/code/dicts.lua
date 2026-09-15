# dicts.lua

Dictionaries in Lua.

A dictionary uses named keys instead of numbers.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## Creating a Dictionary

```lua
local player = {
    name = "Alex",
    level = 5,
    health = 100,
    coins = 50
}
```

The keys are `name`, `level`, `health`, `coins`.
The values are what you see on the right.

---

## Accessing Values

Two ways:

```lua
print(player.name)       -- Alex
print(player["name"])    -- Alex
```

The dot is shorter.
Use the dot when the key is a simple word.

Use brackets when the key has spaces or comes from a variable.

```lua
local key = "level"
print(player[key])       -- 5
```

---

## Adding New Keys

```lua
local player = {name = "Alex"}

player.level = 5
player.health = 100
player.coins = 50

print(player.level)      -- 5
```

You can add keys any time.

---

## Changing Values

```lua
local player = {name = "Alex", level = 5}

player.level = 10
print(player.level)      -- 10
```

---

## Removing Keys

Set the value to nil.

```lua
local player = {name = "Alex", level = 5}

player.level = nil
print(player.level)      -- nil
```

Setting to nil removes the key.

---

## Checking if a Key Exists

```lua
local player = {name = "Alex"}

if player.name then
    print("Has name")
end

if player.level then
    print("Has level")
else
    print("No level yet")
end
```

Any key that is not set returns nil.

---

## Looping Through a Dictionary

Use `pairs`.

```lua
local player = {name = "Alex", level = 5, coins = 100}

for key, value in pairs(player) do
    print(key, value)
end
```

Output:

```text
name   Alex
level  5
coins  100
```

The order is not guaranteed.

---

## Counting Keys

There is no built-in count.
Write a loop.

```lua
local function countKeys(t)
    local n = 0
    for _ in pairs(t) do
        n = n + 1
    end
    return n
end

local player = {name = "Alex", level = 5, coins = 100}
print(countKeys(player))     -- 3
```

---

## A Dictionary of Dictionaries

```lua
local players = {
    alex = {level = 5, coins = 100},
    bob = {level = 3, coins = 50},
    charlie = {level = 8, coins = 200}
}

print(players.alex.level)     -- 5
print(players.bob.coins)      -- 50
print(players.charlie.level)  -- 8
```

Loop through them:

```lua
for name, data in pairs(players) do
    print(name, data.level, data.coins)
end
```

Output:

```text
alex  5  100
bob  3  50
charlie  8  200
```

The order may be different each run.

---

## A Config Example

```lua
local config = {
    gameName = "Code Forge",
    maxPlayers = 12,
    roundTime = 300,
    startingCoins = 0,
    difficulty = "normal"
}

print(config.gameName)       -- Code Forge
print(config.maxPlayers)     -- 12
print(config.roundTime)      -- 300
```

This is how real Roblox games store settings.

---

## An Item Example

```lua
local sword = {
    name = "Iron Sword",
    damage = 15,
    price = 100,
    rarity = "common",
    description = "A basic blade"
}

print(sword.name)
print("Damage: " .. sword.damage)
print("Price: " .. sword.price)
```

---

## A Function That Uses a Dictionary

```lua
local function describe(item)
    print("Name: " .. item.name)
    print("Damage: " .. item.damage)
    print("Price: " .. item.price)
end

local sword = {name = "Iron Sword", damage = 15, price = 100}
describe(sword)
```

Output:

```text
Name: Iron Sword
Damage: 15
Price: 100
```

---

## A Loot Table

```lua
local lootTable = {
    {name = "Coin", chance = 60},
    {name = "Silver Coin", chance = 25},
    {name = "Gold Coin", chance = 12},
    {name = "Diamond", chance = 3}
}

local function rollLoot()
    local roll = math.random(1, 100)
    local total = 0

    for _, item in ipairs(lootTable) do
        total = total + item.chance
        if roll <= total then
            return item.name
        end
    end

    return "Nothing"
end

print("You got: " .. rollLoot())
```

---

## Merging Two Dictionaries

```lua
local function merge(a, b)
    local result = {}
    for k, v in pairs(a) do result[k] = v end
    for k, v in pairs(b) do result[k] = v end
    return result
end

local defaults = {health = 100, mana = 50}
local overrides = {health = 150}

local player = merge(defaults, overrides)

print(player.health)     -- 150
print(player.mana)       -- 50
```

---

## Common Mistakes

Mistake 1: Using the wrong key case.

```lua
local player = {Name = "Alex"}
print(player.name)       -- nil, key is "Name", not "name"
```

Mistake 2: Forgetting the value is nil.

```lua
local player = {name = "Alex"}
print(player.level)      -- nil, not an error
```

Check before using:

```lua
if player.level then
    print(player.level)
end
```

Mistake 3: Using ipairs on a dictionary.

```lua
for i, v in ipairs(player) do     -- nothing happens
```

Use `pairs`.

Mistake 4: Expecting a specific order in pairs.

The order is not guaranteed.
If you need order, sort the keys first.

Mistake 5: Trying to add two dictionaries with `+`.

```lua
local c = a + b     -- ERROR
```

Use a merge function.

---

## Summary

- Dictionaries use named keys
- Access with `dict.key` or `dict["key"]`
- Add keys by assigning
- Remove keys by setting to nil
- Use `pairs` to loop
- Count keys with a loop
- Merge with a helper function
- The order is not guaranteed
