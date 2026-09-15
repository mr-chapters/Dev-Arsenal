# Challenge 05 - Conditionals

This is your exercise for Lesson 05.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that makes decisions based on player stats.

The script must:

- Create several variables for player state
- Use at least one if statement
- Use at least one if and else
- Use at least one elseif chain
- Use at least one and or or
- Use at least one not
- Print different messages based on the conditions

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
=== Player Check ===
Health: 75
Coins: 50
Level: 5
Has Key: true
Is Dead: false

Status: Alive
Can buy item: true
Rank: Beginner
Access granted: true
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- At least four variables with different types
- One if statement with just a then
- One if and else
- One if, elseif, elseif, else
- One condition using and
- One condition using or
- One condition using not
- At least five print statements showing results

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Check if a number is even or odd.

```lua
local n = 7

-- if n % 2 == 0 then even else odd
```

### Bonus 2

Check if a player can enter a dungeon.

Rules:

- Level must be at least 10
- They must have a key
- They must be alive

### Bonus 3

Grade calculator.

```lua
local score = 87

-- A: >= 90
-- B: >= 80
-- C: >= 70
-- D: >= 60
-- F: below 60
```

### Bonus 4

Check if a number is positive, negative, or zero.

```lua
local n = -5
```

### Bonus 5

Check if a player's username is valid.

Rules:

- Must not be empty
- Must be at least 3 characters long

### Bonus 6

Login check.

```lua
local username = "Alex"
local password = "secret"

-- Check both match known values
```

---

## Hints

Hint for a simple if:

```lua
if health > 0 then
    print("Alive")
end
```

Hint for if and else:

```lua
if coins >= price then
    print("Can buy")
else
    print("Cannot buy")
end
```

Hint for elseif:

```lua
if level >= 50 then
    print("Veteran")
elseif level >= 20 then
    print("Experienced")
else
    print("Beginner")
end
```

Hint for and:

```lua
if health > 0 and hasKey then
    print("Can enter")
end
```

Hint for or:

```lua
if isAdmin or isModerator then
    print("Has powers")
end
```

Hint for not:

```lua
if not isDead then
    print("Alive")
end
```

Hint for checking even or odd:

```lua
if n % 2 == 0 then
    print("even")
else
    print("odd")
end
```

---

## Common Mistakes to Avoid

- Using `=` instead of `==` for comparisons
- Forgetting `then` after the condition
- Forgetting `end` at the end of the block
- Writing `else if` instead of `elseif`
- Using `and` when you meant `or`
- Forgetting that `0` and `""` are true in Lua
- Forgetting to press F5 to run the script

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Basic if statements
- If and else
- Elseif chains
- Comparing values with ==, ~=, >, <, >=, <=
- Combining conditions with and, or, not
- Making decisions based on player state

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I used at least one if statement
- [ ] I used at least one if and else
- [ ] I used at least one elseif chain
- [ ] I used and, or, and not at least once each
- [ ] I printed different messages based on conditions
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [06 - Loops](../06-loops/README.md).

---

Next: [06 - Loops](../06-loops/README.md)
