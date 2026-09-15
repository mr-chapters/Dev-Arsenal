# Challenge 08 - Tables

This is your exercise for Lesson 08.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that uses arrays and dictionaries to store game data.

The script must:

- Create at least two arrays
- Create at least two dictionaries
- Create at least one nested table
- Loop through an array with `ipairs`
- Loop through a dictionary with `pairs`
- Use `table.insert` and `table.remove`
- Use `#` to get the length

---

## Step by Step

1. Open Roblox Studio
2. In the Explorer, click ServerScriptService
3. Right-click it and choose Insert Object, then Script
4. Delete the default code inside the script
5. Write your own code
6. Press F5 to play
7. Check the Output window (press F9)
8. Fix any errors you see
9. Save your work

---

## Expected Output

When your script runs, the Output window should show something like:

```text
=== Inventory ===
1  sword
2  shield
3  potion
4  map

Inventory size: 4

After adding a key:
1  sword
2  shield
3  potion
4  map
5  key

After removing the shield:
1  sword
2  potion
3  map
4  key

=== Player ===
name   Alex
level  5
coins  100

=== Nested Data ===
Player: Alex
Health: 100
Mana: 50
First item: sword
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- At least two arrays
- At least two dictionaries
- At least one nested table
- One `ipairs` loop
- One `pairs` loop
- At least one `table.insert`
- At least one `table.remove`
- At least one use of `#`

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Create an array of numbers and find the largest.

```lua
local numbers = {5, 2, 9, 1, 7}
-- find the max
```

Expected output: `9`

### Bonus 2

Create an array of numbers and calculate the sum.

Expected output for `{5, 2, 9, 1, 7}` is `24`.

### Bonus 3

Sort an array of names alphabetically.

```lua
local names = {"Charlie", "Alex", "Bob"}
table.sort(names)
```

### Bonus 4

Create a dictionary for a shop item.

```lua
local item = {
    name = "Health Potion",
    price = 25,
    quantity = 10,
    description = "Restores 50 HP"
}
```

Print each field.

### Bonus 5

Create a nested table for a player with stats and inventory.

```lua
local player = {
    name = "Alex",
    stats = {health = 100, mana = 50},
    inventory = {"sword", "shield"}
}
```

### Bonus 6

Write a function that checks if a value exists in an array.

```lua
local function contains(list, value)
    -- return true or false
end
```

### Bonus 7

Write a function that reverses an array.

```lua
local function reverse(list)
    -- return a new reversed array
end
```

---

## Hints

Hint for creating an array:

```lua
local fruits = {"apple", "banana", "cherry"}
```

Hint for creating a dictionary:

```lua
local player = {name = "Alex", level = 5}
```

Hint for a nested table:

```lua
local player = {
    name = "Alex",
    stats = {health = 100}
}
```

Hint for looping an array:

```lua
for i, v in ipairs(fruits) do
    print(i, v)
end
```

Hint for looping a dictionary:

```lua
for k, v in pairs(player) do
    print(k, v)
end
```

Hint for adding:

```lua
table.insert(fruits, "mango")
```

Hint for removing:

```lua
table.remove(fruits, 1)
```

Hint for length:

```lua
print(#fruits)
```

Hint for accessing nested:

```lua
print(player.stats.health)
```

---

## Common Mistakes to Avoid

- Using 0 as the first index (Lua starts at 1)
- Using `pairs` on an array expecting order
- Using `ipairs` on a dictionary expecting all keys
- Forgetting `table.` before insert or remove
- Changing a table while looping over it
- Copying a table with `=` instead of a loop
- Forgetting that `#` gives the highest numeric index, not count, when there are gaps
- Forgetting to press F5 to run the script

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Creating arrays
- Creating dictionaries
- Creating nested tables
- Looping with ipairs and pairs
- Inserting and removing items
- Accessing nested values
- Using # for length

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I created at least two arrays
- [ ] I created at least two dictionaries
- [ ] I created a nested table
- [ ] I used ipairs
- [ ] I used pairs
- [ ] I used table.insert
- [ ] I used table.remove
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [09 - Metatables](../09-metatables/README.md).

---

Next: [09 - Metatables](../09-metatables/README.md)
