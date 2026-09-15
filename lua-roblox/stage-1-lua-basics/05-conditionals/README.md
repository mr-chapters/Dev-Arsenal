# 05 - Conditionals

In this lesson you will learn how to make decisions in your code.

You will learn:

- What a conditional is
- How to use if, elseif, and else
- Comparison operators
- Logical operators
- How to combine conditions
- How to nest conditionals

Conditionals are how your game makes choices.
Is the player dead? Did they hit the enemy? Do they have enough coins?

Every game uses them constantly.

---

## What Is a Conditional

A conditional lets your code choose between different paths.

The simplest form is if:

```lua
if x > 10 then
    print("x is big")
end
```

The code inside the if only runs when the condition is true.

If the condition is false, the code is skipped.

---

## If Statements

The pattern is:

```lua
if condition then
    -- runs when condition is true
end
```

Example:

```lua
local health = 75

if health > 0 then
    print("Player is alive")
end
```

The `then` keyword marks the start of the code that runs.

The `end` keyword marks the end of the if block.

Every if needs an end.

---

## If and Else

Use else to run code when the condition is false.

```lua
local health = 0

if health > 0 then
    print("Player is alive")
else
    print("Player is dead")
end
```

Only one of the two blocks runs.

If the condition is true, the if block runs.
If the condition is false, the else block runs.

---

## Elseif

Use elseif to check more than one condition.

```lua
local score = 75

if score >= 90 then
    print("Grade A")
elseif score >= 80 then
    print("Grade B")
elseif score >= 70 then
    print("Grade C")
else
    print("Grade F")
end
```

Lua checks each condition in order.
The first true one wins.
Everything after is skipped.

The else at the end is optional.
It runs when no condition matched.

---

## Comparison Operators

These are used to compare values.

| Operator | Meaning |
|----------|---------|
| == | equal to |
| ~= | not equal to |
| > | greater than |
| < | less than |
| >= | greater than or equal to |
| <= | less than or equal to |

Example:

```lua
local a = 10
local b = 20

print(a == b)     -- false
print(a ~= b)     -- true
print(a > b)      -- false
print(a < b)      -- true
print(a >= 10)    -- true
print(a <= 5)     -- false
```

The result of a comparison is a boolean: true or false.

---

## Comparing Strings

You can compare strings too.

```lua
local name = "Alex"

if name == "Alex" then
    print("Hello, Alex")
end

if name ~= "Bob" then
    print("You are not Bob")
end
```

Strings must match exactly.
Case matters.

```lua
local a = "Hello"
local b = "hello"

print(a == b)     -- false
```

---

## Logical Operators

You can combine conditions with and, or, and not.

### and

Both must be true.

```lua
local health = 50
local hasShield = true

if health > 0 and hasShield then
    print("Protected")
end
```

### or

At least one must be true.

```lua
local isAdmin = false
local isModerator = true

if isAdmin or isModerator then
    print("You have powers")
end
```

### not

Flips the value.

```lua
local isDead = false

if not isDead then
    print("Still alive")
end
```

---

## Combining Multiple Operators

```lua
local health = 50
local maxHealth = 100
local hasShield = true

if health > 0 and health < maxHealth and hasShield then
    print("Hurt but protected")
end
```

Use parentheses to make logic clear.

```lua
if (health > 0) and (health < maxHealth or hasShield) then
    print("Alive and either hurt or shielded")
end
```

---

## Truthy and Falsy Values

In Lua, only two values are false:

- false
- nil

Everything else is true.

```lua
if 0 then
    print("0 is true in Lua")
end

if "" then
    print("empty string is true in Lua")
end

if nil then
    print("this never runs")
end
```

This surprises people from other languages.
In Lua, 0 is true.

---

## Nested Conditionals

You can put an if inside another if.

```lua
local health = 50
local hasPotion = true

if health < 100 then
    if hasPotion then
        print("You can heal")
    else
        print("Find a potion")
    end
end
```

Nesting works but can get messy.
Try to combine conditions with and when possible.

```lua
if health < 100 and hasPotion then
    print("You can heal")
end
```

---

## Real Game Examples

### Check if the player can attack

```lua
local health = 75
local cooldown = 0

if health > 0 and cooldown == 0 then
    print("Attack ready")
else
    print("Cannot attack")
end
```

### Check if the player has enough coins

```lua
local coins = 100
local price = 75

if coins >= price then
    print("Purchase successful")
    coins = coins - price
else
    print("Not enough coins")
end

print("Coins left: " .. coins)
```

### Check the player's level

```lua
local level = 5

if level >= 50 then
    print("Veteran player")
elseif level >= 20 then
    print("Experienced player")
elseif level >= 10 then
    print("Intermediate player")
else
    print("Beginner player")
end
```

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
local health = 75

if health > 0 then
    print("Alive")
else
    print("Dead")
end

local coins = 50
local price = 30

if coins >= price then
    print("Can buy")
else
    print("Cannot buy")
end
```

Press F5.
Check the Output window.

Now change the values.
Run it again.
See how the output changes.

---

## Common Mistakes

Mistake: Using = instead of ==.

Result: `=` is assignment. `==` is comparison.
Fix: Use `==` for comparisons.

Mistake: Forgetting the then keyword.

Result: Syntax error.
Fix: Always write `if condition then`.

Mistake: Forgetting the end keyword.

Result: Syntax error.
Fix: Every if needs an end. Every elseif and else does not.

Mistake: Using semicolons at the end of lines.

Result: Lua does not need them.
Fix: Do not add semicolons.

Mistake: Writing `else if` instead of `elseif`.

Result: Lua treats them as two separate things and requires two ends.
Fix: Write `elseif` as one word.

Mistake: Comparing different types.

Result: `"5" == 5` is false. They are not the same type.
Fix: Keep types consistent.

---

## Summary

- Use if to run code when a condition is true
- Use else to run code when it is false
- Use elseif to check more conditions
- Comparisons use ==, ~=, >, <, >=, <=
- Combine conditions with and, or, not
- Only false and nil are false in Lua
- Nesting works but can be avoided with and
- Every if must end with end

You will use conditionals in every script from now on.

---

## Files in This Lesson

- [code/if-else.lua](code/if-else.lua) - basic conditionals
- [code/elseif.lua](code/elseif.lua) - multiple conditions
- [code/logic-ops.lua](code/logic-ops.lua) - combining conditions
- [challenge.md](challenge.md) - your exercise

---

Next: [code/if-else.lua](code/if-else.lua)
