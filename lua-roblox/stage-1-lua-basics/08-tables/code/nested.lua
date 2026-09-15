# nested.lua

Nested tables in Lua.

A table can contain other tables.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## A Table Inside a Table

```lua
local player = {
    name = "Alex",
    stats = {
        health = 100,
        mana = 50,
        stamina = 75
    }
}
```

The `stats` key holds another table.

---

## Accessing Nested Values

```lua
print(player.name)                -- Alex
print(player.stats.health)        -- 100
print(player.stats.mana)          -- 50
print(player.stats.stamina)       -- 75
```

Chain the dots to go deeper.

You can also use brackets.

```lua
print(player["stats"]["health"])  -- 100
```

---

## Changing Nested Values

```lua
player.stats.health = 80
print(player.stats.health)        -- 80
```

---

## Adding a Nested Value

```lua
player.stats.speed = 20
print(player.stats.speed)         -- 20
```

---

## An Array Inside a Table

```lua
local player = {
    name = "Alex",
    inventory = {"sword", "shield", "potion"}
}

print(player.inventory[1])        -- sword
print(player.inventory[2])        -- shield
print(player.inventory[3])        -- potion
print(#player.inventory)          -- 3
```

---

## A Table with Both

```lua
local player = {
    name = "Alex",
    stats = {
        health = 100,
        mana = 50
    },
    inventory = {"sword", "shield", "potion"}
}

print(player.name)                -- Alex
print(player.stats.health)        -- 100
print(player.inventory[1])        -- sword
```

---

## Looping Through Nested Data

```lua
local player = {
    name = "Alex",
    stats = {
        health = 100,
        mana = 50,
        stamina = 75
    }
}

for key, value in pairs(player.stats) do
    print(key, value)
end
```

Output:

```text
health  100
mana  50
stamina  75
```

---

## A List of Players

```lua
local players = {
    {name = "Alex", level = 5, coins = 100},
    {name = "Bob", level = 3, coins = 50},
    {name = "Charlie", level = 8, coins = 200}
}

for _, player in ipairs(players) do
    print(player.name, player.level, player.coins)
end
```

Output:

```text
Alex  5  100
Bob  3  50
Charlie  8  200
```

---

## A Dictionary of Players

```lua
local players = {
    alex = {level = 5, coins = 100},
    bob = {level = 3, coins = 50}
}

for name, data in pairs(players) do
    print(name, data.level, data.coins)
end
```

Output:

```text
alex  5  100
bob  3  50
```

The order may be different each run.

---

## Deep Nesting

You can nest as deep as you want.

```lua
local world = {
    name = "Overworld",
    regions = {
        forest = {
            name = "Dark Forest",
            enemies = {"wolf", "bandit"},
            boss = {
                name = "Forest Guardian",
                health = 500,
                drops = {"Wooden Sword", "Forest Gem"}
            }
        },
        desert = {
            name = "Scorching Desert",
            enemies = {"scorpion", "mummy"},
            boss = {
                name = "Sand Pharaoh",
                health = 800,
                drops = {"Golden Staff", "Sun Amulet"}
            }
        }
    }
}

print(world.name)                                            -- Overworld
print(world.regions.forest.name)                             -- Dark Forest
print(world.regions.forest.boss.name)                        -- Forest Guardian
print(world.regions.forest.boss.drops[1])                    -- Wooden Sword
print(world.regions.desert.boss.health)                      -- 800
```

---

## Loop Through Deep Nested Data

```lua
for regionKey, region in pairs(world.regions) do
    print("Region: " .. region.name)
    print("  Boss: " .. region.boss.name)
    print("  Boss HP: " .. region.boss.health)
    for _, drop in ipairs(region.boss.drops) do
        print("  Drop: " .. drop)
    end
end
```

Output:

```text
Region: Dark Forest
  Boss: Forest Guardian
  Boss HP: 500
  Drop: Wooden Sword
  Drop: Forest Gem
Region: Scorching Desert
  Boss: Sand Pharaoh
  Boss HP: 800
  Drop: Golden Staff
  Drop: Sun Amulet
```

The order may differ.

---

## A Real Example: Inventory System

```lua
local player = {
    name = "Alex",
    coins = 500,
    inventory = {
        {name = "Iron Sword", damage = 15, quantity = 1},
        {name = "Health Potion", heal = 50, quantity = 5},
        {name = "Shield", defense = 10, quantity = 1}
    }
}

for _, item in ipairs(player.inventory) do
    print(item.name .. " x" .. item.quantity)
end
```

Output:

```text
Iron Sword x1
Health Potion x5
Shield x1
```

---

## Deep Copy

Copying a nested table with `=` only copies the reference.

```lua
local a = {stats = {health = 100}}
local b = a

b.stats.health = 50
print(a.stats.health)     -- 50, changed too
```

Write a deep copy function:

```lua
local function deepCopy(t)
    if type(t) ~= "table" then
        return t
    end
    local new = {}
    for k, v in pairs(t) do
        new[k] = deepCopy(v)
    end
    return new
end

local a = {stats = {health = 100}}
local b = deepCopy(a)

b.stats.health = 50

print(a.stats.health)     -- 100, unchanged
print(b.stats.health)     -- 50
```

---

## Finding a Player by Name

```lua
local players = {
    {name = "Alex", level = 5},
    {name = "Bob", level = 3},
    {name = "Charlie", level = 8}
}

local function findPlayer(name)
    for _, p in ipairs(players) do
        if p.name == name then
            return p
        end
    end
    return nil
end

local found = findPlayer("Bob")
if found then
    print("Found: " .. found.name .. " level " .. found.level)
end
```

Output:

```text
Found: Bob level 3
```

---

## Counting Total Items

```lua
local player = {
    inventory = {
        {name = "Sword", quantity = 1},
        {name = "Potion", quantity = 5},
        {name = "Arrow", quantity = 100}
    }
}

local total = 0
for _, item in ipairs(player.inventory) do
    total = total + item.quantity
end

print("Total items: " .. total)     -- 106
```

---

## Common Mistakes

Mistake 1: Forgetting a level of nesting.

```lua
print(player.health)          -- nil, health is inside stats
print(player.stats.health)    -- 100
```

Mistake 2: Using the wrong type of loop.

Use `ipairs` for arrays, `pairs` for dictionaries.

```lua
for i, v in ipairs(player.stats) do     -- nothing, stats is a dictionary
for k, v in pairs(player.stats) do      -- works
```

Mistake 3: Copying with `=`.

This copies the reference, not the values.
Use `deepCopy` for nested tables.

Mistake 4: Accessing a key that does not exist.

```lua
print(player.stats.speed)     -- nil, not an error
```

Check first if it matters:

```lua
if player.stats.speed then
    print(player.stats.speed)
end
```

Mistake 5: Trying to index nil.

```lua
local p = {}
print(p.stats.health)         -- ERROR, stats is nil
```

Check each level:

```lua
if p.stats and p.stats.health then
    print(p.stats.health)
end
```

---

## Summary

- Tables can contain other tables
- Access nested values by chaining dots
- Loop nested tables with ipairs or pairs
- Mix arrays and dictionaries
- Use deep copy for nested data
- Check each level if you are not sure it exists
