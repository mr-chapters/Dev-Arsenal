# 08 - Tables

In this lesson you will learn how to store many values in one place.

You will learn:

- What a table is
- Arrays
- Dictionaries
- Nested tables
- Looping through tables
- Common table functions

Tables are the most important data structure in Lua.
Every list of players, every inventory, every config file is a table.

---

## What Is a Table

A table is a container that holds many values.

You write it with curly braces.

```lua
local fruits = {"apple", "banana", "cherry"}
```

This table holds three values.

You access them by index.

```lua
print(fruits[1])     -- apple
print(fruits[2])     -- banana
print(fruits[3])     -- cherry
```

Lua table indexes start at 1, not 0.

---

## Empty Tables

You can create an empty table and fill it later.

```lua
local list = {}
list[1] = "first"
list[2] = "second"
list[3] = "third"

print(list[1])     -- first
print(list[2])     -- second
print(list[3])     -- third
```

This is useful when you are building a list step by step.

---

## Arrays

An array is a table where the keys are numbers 1, 2, 3, and so on.

```lua
local colors = {"red", "green", "blue", "yellow"}

print(#colors)           -- 4
print(colors[1])         -- red
print(colors[4])         -- yellow
print(colors[5])         -- nil, does not exist
```

The `#` operator gives the length of the array.

---

## Adding to an Array

Use `table.insert` to add items.

```lua
local fruits = {"apple", "banana"}
table.insert(fruits, "cherry")
table.insert(fruits, "mango")

print(#fruits)           -- 4
print(fruits[3])         -- cherry
print(fruits[4])         -- mango
```

Insert always adds at the end.

You can also insert at a specific position.

```lua
table.insert(fruits, 1, "grape")
print(fruits[1])         -- grape
```

This pushes everything else to the right.

---

## Removing from an Array

Use `table.remove` to remove items.

```lua
local fruits = {"apple", "banana", "cherry"}

table.remove(fruits, 2)     -- removes "banana"
print(fruits[1])            -- apple
print(fruits[2])            -- cherry
```

If you do not pass an index, it removes the last item.

```lua
table.remove(fruits)        -- removes the last item
```

---

## Dictionaries

A dictionary uses named keys instead of numbers.

```lua
local player = {
    name = "Alex",
    level = 5,
    health = 100,
    coins = 50
}

print(player.name)       -- Alex
print(player.level)      -- 5
print(player.health)     -- 100
```

You can also access with brackets.

```lua
print(player["name"])    -- Alex
print(player["level"])   -- 5
```

The dot is shorter. Use it when the key is a simple word.

---

## Adding to a Dictionary

```lua
local player = {name = "Alex"}

player.level = 5
player.health = 100
player.coins = 50

print(player.level)      -- 5
```

You can add new keys any time.

---

## Removing from a Dictionary

Set the value to nil.

```lua
local player = {name = "Alex", level = 5}

player.level = nil
print(player.level)      -- nil
```

Setting a key to nil removes it.

---

## Nested Tables

A table can contain other tables.

```lua
local player = {
    name = "Alex",
    stats = {
        health = 100,
        mana = 50,
        stamina = 75
    },
    inventory = {"sword", "shield", "potion"}
}

print(player.name)                    -- Alex
print(player.stats.health)            -- 100
print(player.inventory[1])            -- sword
print(player.inventory[3])            -- potion
```

This is how complex game data is organized.

---

## Looping Through Arrays

Use `ipairs` to loop through arrays.

```lua
local fruits = {"apple", "banana", "cherry"}

for index, fruit in ipairs(fruits) do
    print(index, fruit)
end
```

Output:

```text
1  apple
2  banana
3  cherry
```

The first variable is the index (1, 2, 3).
The second variable is the value.

---

## Looping Through Dictionaries

Use `pairs` to loop through dictionaries.

```lua
local player = {name = "Alex", level = 5, coins = 100}

for key, value in pairs(player) do
    print(key, value)
end
```

Output:

```text
name  Alex
level  5
coins  100
```

The order is not guaranteed.
Do not rely on it.

---

## The Difference Between ipairs and pairs

`ipairs` goes through the array part, in order, from 1 to the end.

`pairs` goes through every key, in any order.

```lua
local mixed = {10, 20, name = "Alex", 30}

for i, v in ipairs(mixed) do
    print(i, v)
end
-- 1  10
-- 2  20
-- 3  30

for k, v in pairs(mixed) do
    print(k, v)
end
-- 1  10
-- 2  20
-- 3  30
-- name  Alex
```

Use `ipairs` for arrays. Use `pairs` for dictionaries.

---

## Finding a Value

```lua
local fruits = {"apple", "banana", "cherry"}

for index, fruit in ipairs(fruits) do
    if fruit == "banana" then
        print("Found at index " .. index)
        break
    end
end
```

Output:

```text
Found at index 2
```

---

## Checking if a Value Exists

```lua
local function contains(list, value)
    for _, item in ipairs(list) do
        if item == value then
            return true
        end
    end
    return false
end

local fruits = {"apple", "banana", "cherry"}
print(contains(fruits, "banana"))     -- true
print(contains(fruits, "grape"))      -- false
```

---

## Sorting a Table

Use `table.sort`.

```lua
local numbers = {5, 2, 9, 1, 7}
table.sort(numbers)

for _, n in ipairs(numbers) do
    print(n)
end
```

Output:

```text
1
2
5
7
9
```

You can also sort with a custom comparison.

```lua
local words = {"banana", "apple", "cherry"}
table.sort(words, function(a, b)
    return a < b
end)

for _, w in ipairs(words) do
    print(w)
end
```

Output:

```text
apple
banana
cherry
```

---

## Copying a Table

Tables are passed by reference.

```lua
local original = {1, 2, 3}
local copy = original

copy[1] = 99

print(original[1])     -- 99, changed too
```

To make a real copy:

```lua
local function copyTable(t)
    local new = {}
    for k, v in pairs(t) do
        new[k] = v
    end
    return new
end

local original = {1, 2, 3}
local copy = copyTable(original)

copy[1] = 99

print(original[1])     -- 1, unchanged
print(copy[1])         -- 99
```

For nested tables, you need a deep copy.

---

## Common Table Functions

| Function | What It Does |
|----------|--------------|
| table.insert(t, v) | Add to end |
| table.insert(t, i, v) | Insert at position i |
| table.remove(t) | Remove last |
| table.remove(t, i) | Remove at position i |
| table.sort(t) | Sort in place |
| table.concat(t, sep) | Join into a string |
| #t | Length of array |

Example of `table.concat`:

```lua
local fruits = {"apple", "banana", "cherry"}
print(table.concat(fruits, ", "))
```

Output:

```text
apple, banana, cherry
```

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
local fruits = {"apple", "banana", "cherry"}

for i, fruit in ipairs(fruits) do
    print(i, fruit)
end

local player = {
    name = "Alex",
    level = 5,
    coins = 100
}

for key, value in pairs(player) do
    print(key, value)
end
```

Press F5.
Check the Output window.

Now add items, remove items, change values.
Run it again.
See how the output changes.

---

## Common Mistakes

Mistake: Using 0 as the first index.

```lua
local list = {"a", "b", "c"}
print(list[0])     -- nil
print(list[1])     -- a
```

Lua indexes start at 1.

Mistake: Mixing ipairs and pairs.

Use `ipairs` for arrays, `pairs` for dictionaries.

Mistake: Expecting pairs to be in order.

The order is not guaranteed.

Mistake: Forgetting the # gives the highest numeric index, not the count.

If the array has gaps, # may not be what you expect.

Mistake: Changing a table while looping.

This can cause weird behavior.
Copy the table first if you need to modify it.

Mistake: Copying a table with `=`.

That copies the reference, not the values.
Use a copy loop.

---

## Summary

- Tables hold many values
- Arrays use numbers as keys, starting at 1
- Dictionaries use names as keys
- Nested tables let you store complex data
- `ipairs` loops through arrays in order
- `pairs` loops through dictionaries
- `table.insert` adds items
- `table.remove` removes items
- `table.sort` sorts in place
- `#` gives the length of an array
- Tables are passed by reference

Tables are everywhere in Roblox.
Players, parts, inventory, config, all tables.

---

## Files in This Lesson

- [code/arrays.lua](code/arrays.lua) - array basics
- [code/dicts.lua](code/dicts.lua) - dictionary basics
- [code/nested.lua](code/nested.lua) - nested tables
- [challenge.md](challenge.md) - your exercise

---

Next: [code/arrays.md](code/arrays.md)
