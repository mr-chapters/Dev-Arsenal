# arrays.lua

Arrays in Lua.

An array is a table where the keys are numbers 1, 2, 3, and so on.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## Creating an Array

```lua
local fruits = {"apple", "banana", "cherry"}
```

This table has three items.
The indexes are 1, 2, and 3.

---

## Accessing Items

```lua
local fruits = {"apple", "banana", "cherry"}

print(fruits[1])     -- apple
print(fruits[2])     -- banana
print(fruits[3])     -- cherry
```

Lua indexes start at 1.

```lua
print(fruits[0])     -- nil
```

---

## The Length Operator

The `#` operator gives the length of the array.

```lua
local fruits = {"apple", "banana", "cherry"}
print(#fruits)       -- 3
```

For an empty array:

```lua
local empty = {}
print(#empty)        -- 0
```

---

## Changing an Item

```lua
local fruits = {"apple", "banana", "cherry"}

fruits[2] = "grape"

print(fruits[1])     -- apple
print(fruits[2])     -- grape
print(fruits[3])     -- cherry
```

---

## Adding Items

Use `table.insert`.

```lua
local fruits = {"apple", "banana"}

table.insert(fruits, "cherry")
table.insert(fruits, "mango")

print(#fruits)       -- 4
print(fruits[3])     -- cherry
print(fruits[4])     -- mango
```

Insert at a specific position:

```lua
local fruits = {"apple", "banana", "cherry"}
table.insert(fruits, 1, "grape")

print(fruits[1])     -- grape
print(fruits[2])     -- apple
print(fruits[3])     -- banana
print(fruits[4])     -- cherry
```

The rest of the items shift right.

---

## Removing Items

Use `table.remove`.

```lua
local fruits = {"apple", "banana", "cherry"}

table.remove(fruits, 2)
print(fruits[1])     -- apple
print(fruits[2])     -- cherry
```

Remove the last item:

```lua
table.remove(fruits)
```

If you do not pass an index, it removes the last item.

---

## Looping Through an Array

Use `ipairs`.

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

Use `_` if you do not need the index.

```lua
for _, fruit in ipairs(fruits) do
    print(fruit)
end
```

Output:

```text
apple
banana
cherry
```

---

## Arrays of Numbers

```lua
local scores = {10, 25, 50, 75, 100}

for _, score in ipairs(scores) do
    print(score)
end
```

---

## Sum of an Array

```lua
local numbers = {5, 10, 15, 20}
local sum = 0

for _, n in ipairs(numbers) do
    sum = sum + n
end

print("Sum:", sum)     -- 50
```

---

## Largest in an Array

```lua
local numbers = {5, 2, 9, 1, 7}
local largest = numbers[1]

for _, n in ipairs(numbers) do
    if n > largest then
        largest = n
    end
end

print("Largest:", largest)     -- 9
```

---

## Smallest in an Array

```lua
local numbers = {5, 2, 9, 1, 7}
local smallest = numbers[1]

for _, n in ipairs(numbers) do
    if n < smallest then
        smallest = n
    end
end

print("Smallest:", smallest)     -- 1
```

---

## Reversing an Array

```lua
local function reverse(list)
    local newList = {}
    for i = #list, 1, -1 do
        table.insert(newList, list[i])
    end
    return newList
end

local fruits = {"apple", "banana", "cherry"}
local reversed = reverse(fruits)

for _, fruit in ipairs(reversed) do
    print(fruit)
end
```

Output:

```text
cherry
banana
apple
```

---

## Sorting an Array

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

Sorting strings:

```lua
local names = {"Charlie", "Alex", "Bob"}
table.sort(names)

for _, name in ipairs(names) do
    print(name)
end
```

Output:

```text
Alex
Bob
Charlie
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

## Finding the Index of a Value

```lua
local function findIndex(list, value)
    for index, item in ipairs(list) do
        if item == value then
            return index
        end
    end
    return nil
end

local fruits = {"apple", "banana", "cherry"}

print(findIndex(fruits, "banana"))     -- 2
print(findIndex(fruits, "grape"))      -- nil
```

---

## Joining an Array into a String

Use `table.concat`.

```lua
local fruits = {"apple", "banana", "cherry"}
print(table.concat(fruits, ", "))
```

Output:

```text
apple, banana, cherry
```

---

## A Real Game Example: Inventory

```lua
local inventory = {"sword", "shield", "potion"}

local function addItem(item)
    table.insert(inventory, item)
    print("Added: " .. item)
end

local function removeItem(item)
    for i, v in ipairs(inventory) do
        if v == item then
            table.remove(inventory, i)
            print("Removed: " .. item)
            return
        end
    end
end

addItem("map")
addItem("key")
removeItem("shield")

print("Inventory:")
for _, item in ipairs(inventory) do
    print("  " .. item)
end
```

Output:

```text
Added: map
Added: key
Removed: shield
Inventory:
  sword
  potion
  map
  key
```

---

## Common Mistakes

Mistake 1: Using 0 as the first index.

```lua
local list = {"a", "b", "c"}
print(list[0])     -- nil
print(list[1])     -- a
```

Mistake 2: Going past the end.

```lua
print(list[4])     -- nil
```

Mistake 3: Using pairs when you want order.

```lua
for i, v in ipairs(list) do     -- ordered
for k, v in pairs(list) do      -- unordered
```

Use `ipairs` for arrays.

Mistake 4: Forgetting `table.` before insert.

```lua
insert(list, "x")           -- ERROR
table.insert(list, "x")     -- OK
```

Mistake 5: Removing while looping.

```lua
for i, v in ipairs(list) do
    if v == "x" then
        table.remove(list, i)     -- skips elements
    end
end
```

Loop backward or build a new list instead.

---

## Summary

- Arrays are tables with number indexes starting at 1
- `#` gives the length
- `table.insert` adds
- `table.remove` removes
- `ipairs` loops in order
- `table.sort` sorts in place
- `table.concat` joins into a string
