# random.lua

Random numbers in Lua and Roblox.

Random numbers are used for loot drops, enemy spawns, critical hits, and much more.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## math.random

`math.random` returns a random number.

It has three forms:

```
print(math.random())        -- decimal between 0 and 1
print(math.random(10))      -- integer from 1 to 10
print(math.random(5, 10))   -- integer from 5 to 10
```

The first form gives a decimal.
The second form gives a whole number from 1 up to the number you pass.
The third form gives a whole number between the two numbers, including both.

---

## Examples

```
print(math.random(1, 6))      -- rolls a die
print(math.random(1, 100))    -- percent chance
print(math.random(50, 150))   -- damage range
print(math.random(1, 10))     -- random slot
```

---

## Random in Roblox

Roblox has its own Random object.
It gives better randomness than `math.random`.

```
local rng = Random.new()

print(rng:NextNumber())            -- decimal between 0 and 1
print(rng:NextInteger(1, 10))      -- integer from 1 to 10
```

Use `Random.new()` for anything that matters.
Use `math.random` for quick tests.

---

## A Die Roll

```
local roll = math.random(1, 6)
print("You rolled a " .. roll)
```

Run it several times.
You will get different numbers each time.

---

## Rolling Two Dice

```
local die1 = math.random(1, 6)
local die2 = math.random(1, 6)
local total = die1 + die2

print("Die 1: " .. die1)
print("Die 2: " .. die2)
print("Total: " .. total)
```

---

## Percent Chance

To check if something should happen based on a percent:

```
local chance = 25
local roll = math.random(1, 100)

if roll <= chance then
    print("Lucky drop!")
else
    print("Better luck next time.")
end
```

Change `chance` to control how often the event fires.

---

## A Loot Drop System

```
local lootTable = {
    { name = "Common Coin",   chance = 60 },
    { name = "Silver Coin",   chance = 25 },
    { name = "Gold Coin",     chance = 12 },
    { name = "Diamond",       chance = 3 },
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

for i = 1, 10 do
    print("Drop " .. i .. ": " .. rollLoot())
end
```

Run it a few times to see the drop rates in action.

---

## Random Damage

```
local baseDamage = 20
local minBonus = 0
local maxBonus = 10

local bonus = math.random(minBonus, maxBonus)
local finalDamage = baseDamage + bonus

print("Damage dealt: " .. finalDamage)
```

---

## Random Enemy Spawn

```
local minX = -50
local maxX = 50
local minZ = -50
local maxZ = 50

local spawnX = math.random(minX, maxX)
local spawnZ = math.random(minZ, maxZ)

print("Enemy spawns at: " .. spawnX .. ", " .. spawnZ)
```

---

## Random Element from a Table

```
local fruits = {"apple", "banana", "cherry", "mango"}

local pick = fruits[math.random(1, #fruits)]
print("You got: " .. pick)
```

The `#fruits` gives the number of items.
`math.random(1, #fruits)` picks a random index.
`fruits[index]` gets the item at that index.

---

## Shuffle a Table

Lua does not have a built-in shuffle.
You can write one.

```
local function shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(1, i)
        t[i], t[j] = t[j], t[i]
    end
end

local cards = {"A", "B", "C", "D", "E"}
shuffle(cards)

for i, card in ipairs(cards) do
    print(i, card)
end
```

Run it several times.
The order will change each time.

---

## Weighted Random (Better Loot)

```
local rng = Random.new()

local items = {
    { name = "Common",   weight = 70 },
    { name = "Uncommon", weight = 20 },
    { name = "Rare",     weight = 8  },
    { name = "Legendary",weight = 2  },
}

local totalWeight = 0
for _, item in ipairs(items) do
    totalWeight = totalWeight + item.weight
end

local function rollWeighted()
    local roll = rng:NextInteger(1, totalWeight)
    local total = 0

    for _, item in ipairs(items) do
        total = total + item.weight
        if roll <= total then
            return item.name
        end
    end

    return items[1].name
end

for i = 1, 20 do
    print(i, rollWeighted())
end
```

---

## Predictable Random (Seeded)

If you want the same random sequence every time, use a seed.

```
local rng = Random.new(12345)

print(rng:NextInteger(1, 100))
print(rng:NextInteger(1, 100))
print(rng:NextInteger(1, 100))
```

Run it several times.
The output is the same every run.

This is useful for testing.

---

## Common Mistakes

Mistake 1: Forgetting the range.

```
math.random()          -- decimal, not integer
math.random(1, 10)     -- integer, correct
```

Mistake 2: Expecting math.random to include the max as exclusive.

```
math.random(1, 10)     -- includes both 1 and 10
```

Mistake 3: Using math.random for security.

Lua's math.random is not cryptographically secure.
For real security, use a proper random source.

Mistake 4: Calling math.random without a range in Lua 5.4.

In Lua 5.4, `math.random()` with no arguments still works.
But for clarity, always pass a range.

Mistake 5: Forgetting to shuffle properly.

The Fisher-Yates shuffle above is the standard.
Do not use `math.random` inside a loop without swapping.

---

## What You Learned

- math.random gives random numbers
- Use a range to get integers
- Random.new() is the Roblox way
- Use percent chance for loot drops
- Roll weighted random for loot tables
- Pick random elements from tables
- Shuffle tables with a loop
- Seed the random for testing
