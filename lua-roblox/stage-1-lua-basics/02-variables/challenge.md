# Challenge 02 - Variables

This is your exercise for Lesson 02.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that stores information about a player character using variables, then prints a profile using those variables.

The script must:

- Create at least six variables
- Use at least three different types
- Print a formatted profile
- Update at least one variable and print it again

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
=== Player Profile ===
Name: Alex
Level: 5
Health: 100
Coins: 50
Alive: true
Guild: nil

After earning coins:
Coins: 150
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- At least six variables
- At least two strings
- At least two numbers
- At least one boolean
- A print statement with a label for each variable
- One variable that changes value during the script
- A final print showing the new value

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Add a comment above each variable explaining what it holds.

### Bonus 2

Build a sentence using several variables with the `..` operator.

Example:

```lua
print(playerName .. " is level " .. playerLevel)
```

### Bonus 3

Create two number variables, `a` and `b`.
Print their sum, difference, product, and quotient.

### Bonus 4

Create a boolean called `isDoorOpen`.
Write an `if` statement that prints "The door is open" if true, and "The door is closed" if false.
Change the boolean and run again.

### Bonus 5

Create a constant using ALL CAPS naming.
Use it in a calculation.

Example:

```lua
local MAX_HEALTH = 100
local currentHealth = MAX_HEALTH - 25
print("Health:", currentHealth)
```

---

## Hints

Hint for creating a variable:

```lua
local name = "Alex"
```

Hint for creating a number:

```lua
local level = 5
```

Hint for creating a boolean:

```lua
local isAlive = true
```

Hint for changing a variable:

```lua
level = level + 1
```

Hint for printing a label and a value:

```lua
print("Level:", level)
```

Hint for combining text:

```lua
print(name .. " is level " .. level)
```

Hint for a comment:

```lua
-- this is the player's name
local name = "Alex"
```

---

## Common Mistakes to Avoid

- Forgetting `local` when creating a variable
- Writing `local` again when changing a variable
- Putting numbers in quotes
- Forgetting quotes around text
- Forgetting the parentheses after `print`
- Forgetting to run the script with F5
- Forgetting to open the Output window

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Creating variables with `local`
- Using strings, numbers, and booleans
- Printing labeled output
- Changing variable values
- Combining variables into sentences
- Using comments

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I created at least six variables
- [ ] I used at least three different types
- [ ] I changed at least one variable and printed the new value
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [03 - Strings](../03-strings/README.md).

---

Next: [03 - Strings](../03-strings/README.md)
