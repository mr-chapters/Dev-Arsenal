# 02 - Variables

In this lesson you will learn how to store data in your script.

You will learn:

- What a variable is
- How to create one
- The three types you will use most
- How to change a variable's value
- Why `local` matters

This is one of the most important lessons in the whole course.
Almost every script you write from now on will use variables.

---

## What Is a Variable

A variable is a name for a value.

Instead of writing `25` over and over, you give it a name like `age`.
Instead of writing `"Alex"` over and over, you give it a name like `name`.

A variable is a box with a label on it.
You put a value inside the box.
Later, you use the label to get the value back out.

---

## Creating a Variable

You create a variable with the `local` keyword.

```lua
local name = "Alex"
local age = 25
local isAlive = true
```

The pattern is always:

```text
local  name  =  value
```

- `local` tells Lua this is a new variable
- `name` is what you want to call it
- `=` means "store this value"
- `value` is what you want to store

---

## The Three Types You Will Use Most

### Strings

A string is text.

```lua
local name = "Alex"
local city = "Accra"
local greeting = "Hello there"
```

Strings always go in double quotes.

### Numbers

A number is any numeric value.

```lua
local age = 25
local price = 9.99
local score = 0
```

Numbers do not go in quotes.
Quotes make them strings.

### Booleans

A boolean is either `true` or `false`.

```lua
local isAlive = true
local hasKey = false
local canJump = true
```

Booleans have no quotes.
They are just `true` or `false`.

---

## Using a Variable

Once you create a variable, you use its name.

```lua
local name = "Alex"
print(name)         -- prints: Alex
print("Hi " .. name)  -- prints: Hi Alex
```

The `..` operator joins two strings together.

```lua
local first = "Hello"
local second = "World"
print(first .. " " .. second)   -- prints: Hello World
```

---

## Changing a Variable

You can change a variable's value any time.

```lua
local score = 0
print(score)     -- 0

score = 10
print(score)     -- 10

score = score + 5
print(score)     -- 15
```

Notice that you do not write `local` again when changing the value.
`local` is only used the first time you create the variable.

The line `score = score + 5` means:
take the current value of `score`, add 5, and store the result back in `score`.

---

## Why `local` Matters

You might see code without `local`:

```lua
name = "Alex"
```

This creates a global variable.
Global variables can be read and changed from anywhere in the game.

That sounds useful, but it causes problems.
Two scripts might use the same name and overwrite each other.

Always use `local` unless you have a very specific reason not to.

For this entire course, use `local` on every new variable.

---

## Printing Variables

`print` works with variables just like it does with raw values.

```lua
local name = "Alex"
local age = 25

print(name)                     -- Alex
print(age)                      -- 25
print("My name is", name)       -- My name is Alex
print("I am", age, "years old") -- I am 25 years old
```

When you print a variable, Lua shows its current value.

---

## Combining Variables

You can build new values from old ones.

```lua
local first = "Alex"
local last = "Johnson"

local full = first .. " " .. last
print(full)     -- Alex Johnson

local a = 5
local b = 3
local sum = a + b
print(sum)      -- 8
```

This is how real code is written.
Small values combined into bigger ones.

---

## Naming Rules

Variable names must follow these rules.

- Can contain letters, numbers, and underscores
- Cannot start with a number
- Cannot contain spaces
- Are case sensitive

Good names:

```lua
local playerName = "Alex"
local maxHealth = 100
local isGameOver = false
local totalScore = 0
```

Bad names:

```lua
local 1stPlace = "Alex"    -- starts with a number
local player name = "Alex" -- contains a space
local MAXHEALTH = 100      -- valid but inconsistent
```

Use camelCase for your variable names.
First word lowercase, then each following word starts with a capital.

---

## Readable Names

Variable names should describe what they hold.

Good:

```lua
local playerScore = 0
local enemyCount = 5
local isDoorOpen = false
```

Bad:

```lua
local x = 0
local y = 5
local z = false
```

Short names like `x` are fine for math or temporary values.
But for anything that lasts more than a few lines, use a real name.

Your future self will thank you.

---

## Constants

Sometimes a value never changes.

You can use `local` but write the name in ALL CAPS to signal "do not change this":

```lua
local MAX_HEALTH = 100
local GRAVITY = 196.2
local STARTING_COINS = 0
```

Lua does not enforce this. It is a convention.
But every Lua developer follows it.

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
local name = "Alex"
local age = 25
local city = "Accra"

print("Name:", name)
print("Age:", age)
print("City:", city)
```

Press F5.
Check the Output window.

Now change the values.
Run it again.
See how the output changes.

Add a fourth variable for your favorite game.
Print it.

---

## Common Mistakes

Mistake: Forgetting `local`.

Result: You create a global variable.
Fix: Always start with `local`.

Mistake: Putting numbers in quotes.

Result: `"25"` is a string, not a number.
Fix: Numbers do not need quotes.

Mistake: Forgetting quotes around text.

Result: Lua treats the text as a variable name and errors.
Fix: Wrap text in `"double quotes"`.

Mistake: Using `local` twice for the same variable.

Result: You create two separate variables.
Fix: Only use `local` the first time.

Mistake: Using a variable before creating it.

Result: `nil` or an error.
Fix: Create the variable first, then use it.

Mistake: Naming a variable with a Lua keyword.

Result: Error.
Fix: Do not use words like `end`, `if`, `then`, `function` as names.

---

## Summary

- A variable is a named value
- Use `local` to create one
- The three main types are string, number, and boolean
- Change a value by assigning to it again without `local`
- Use clear names
- Use ALL CAPS for constants

Variables are everywhere in Roblox code.
Every health bar, every score, every player name lives in a variable.

---

## Files in This Lesson

- [code/variables.lua](code/variables.lua) - basic variable examples
- [code/types.lua](code/types.lua) - the three main types
- [code/constants.lua](code/constants.lua) - constant naming
- [challenge.md](challenge.md) - your exercise

---

Next: [code/variables.lua](code/variables.lua)
