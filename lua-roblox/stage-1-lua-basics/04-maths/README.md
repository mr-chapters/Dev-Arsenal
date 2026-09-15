# 04 - Math

In this lesson you will learn how to do math in Lua.

You will learn:

- Basic arithmetic operators
- Order of operations
- The `math` library
- Rounding numbers
- Random numbers
- Converting between decimals and whole numbers

Math is used in every game.
Damage, health, positions, timers, scores, all math.

---

## Basic Arithmetic

Lua supports the usual math operators.

```lua
local a = 10
local b = 3

print(a + b)    -- 13  addition
print(a - b)    -- 7   subtraction
print(a * b)    -- 30  multiplication
print(a / b)    -- 3.3333333333333  division
print(a % b)    -- 1   modulus (remainder)
print(a ^ b)    -- 1000  power
```

The `%` operator gives the remainder after division.

```lua
print(10 % 3)   -- 1
print(15 % 5)   -- 0
print(7 % 2)    -- 1
```

This is useful for checking if a number is even or odd.

```lua
local n = 7

if n % 2 == 0 then
    print("even")
else
    print("odd")
end
```

The `^` operator raises a number to a power.

```lua
print(2 ^ 3)    -- 8
print(5 ^ 2)    -- 25
print(9 ^ 0.5)  -- 3  (square root)
```

---

## Order of Operations

Lua follows the same order as standard math.

1. Parentheses `()`
2. Exponent `^`
3. Multiplication `*` and Division `/`
4. Addition `+` and Subtraction `-`

```lua
print(2 + 3 * 4)      -- 14, not 20
print((2 + 3) * 4)    -- 20
```

When in doubt, use parentheses.
They make the code clearer even when not strictly needed.

---

## The math Library

Lua has a `math` library with useful functions.

```lua
print(math.floor(3.7))    -- 3  round down
print(math.ceil(3.2))     -- 4  round up
print(math.abs(-5))       -- 5  absolute value
print(math.max(1, 5, 3))  -- 5  largest
print(math.min(1, 5, 3))  -- 1  smallest
print(math.sqrt(16))      -- 4  square root
```

### math.floor

Rounds down to the nearest whole number.

```lua
print(math.floor(3.9))    -- 3
print(math.floor(3.1))    -- 3
print(math.floor(-1.5))   -- -2
```

### math.ceil

Rounds up to the nearest whole number.

```lua
print(math.ceil(3.1))     -- 4
print(math.ceil(3.9))     -- 4
print(math.ceil(-1.5))    -- -1
```

### math.abs

Returns the positive version of a number.

```lua
print(math.abs(-5))       -- 5
print(math.abs(5))        -- 5
print(math.abs(-3.14))    -- 3.14
```

### math.max and math.min

Return the largest or smallest of the arguments.

```lua
print(math.max(1, 5, 3))       -- 5
print(math.min(1, 5, 3))       -- 1
print(math.max(10, 20, 30))    -- 30
```

### math.sqrt

Returns the square root.

```lua
print(math.sqrt(16))     -- 4
print(math.sqrt(25))     -- 5
print(math.sqrt(2))      -- 1.4142135623731
```

---

## Rounding to a Decimal Place

Lua does not have a built-in round-to-decimal function.
You can write one.

```lua
local function round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

print(round(3.14159, 2))   -- 3.14
print(round(3.14159, 3))   -- 3.142
print(round(3.7))          -- 4
```

This is used when you want clean display numbers.

---

## Random Numbers

Lua has `math.random`.

```lua
print(math.random())         -- random decimal between 0 and 1
print(math.random(10))       -- random integer from 1 to 10
print(math.random(5, 10))    -- random integer from 5 to 10
```

### Random in Roblox

Roblox has its own `Random` object that gives better randomness.

```lua
local rng = Random.new()

print(rng:NextNumber())       -- decimal between 0 and 1
print(rng:NextInteger(1, 10)) -- integer from 1 to 10
```

Use `Random.new()` for anything that matters.
Use `math.random` for quick tests.

---

## Combining Math with Variables

You can use math on any numbers, including variables.

```lua
local health = 100
local damage = 25

health = health - damage
print(health)     -- 75

local maxHealth = 100
local currentHealth = 75
local percent = (currentHealth / maxHealth) * 100
print(percent)    -- 75
```

This is how health bars, timers, and scores are calculated.

---

## A Health Bar Example

```lua
local maxHealth = 100
local currentHealth = 75

local percent = (currentHealth / maxHealth) * 100
local bars = math.floor(percent / 10)

print("Health: [" .. string.rep("=", bars) .. string.rep("-", 10 - bars) .. "]")
-- Health: [=======---]
```

This makes a small text health bar.
Looks simple, but the math is the same as real games.

---

## A Damage Calculator

```lua
local baseDamage = 20
local attackMultiplier = 1.5
local defense = 5

local finalDamage = (baseDamage * attackMultiplier) - defense
print("Final damage:", finalDamage)     -- 25
```

---

## Common Math in Roblox

| Use Case | Math |
|----------|------|
| Health bars | `(current / max) * 100` |
| Damage | `base * multiplier - defense` |
| Timer | `minutes * 60 + seconds` |
| Position | `x + velocity * delta` |
| Chance | `math.random(1, 100) <= 5` |
| Score | `score = score + points` |
| Level up | `xp >= level * 100` |
| Distance | `math.sqrt(dx*dx + dz*dz)` |

You will use these constantly in later stages.

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
local a = 10
local b = 3

print("Sum:", a + b)
print("Difference:", a - b)
print("Product:", a * b)
print("Quotient:", a / b)
print("Remainder:", a % b)
print("Power:", a ^ b)

print("Floor:", math.floor(3.7))
print("Ceil:", math.ceil(3.2))
print("Abs:", math.abs(-5))
print("Max:", math.max(a, b))
print("Min:", math.min(a, b))
print("Sqrt:", math.sqrt(16))

print("Random:", math.random(1, 100))
```

Press F5.
Check the Output window.

Now change the values.
Run it again.
See how the output changes.

---

## Common Mistakes

Mistake: Using `^` for multiplication.

Result: `2 ^ 3` is 8, not 6.
Fix: Use `*` for multiplication.

Mistake: Forgetting that `/` always gives a decimal.

Result: `10 / 5` gives `2.0`, not `2`.
Fix: Use `math.floor` if you want a whole number.

Mistake: Dividing by zero.

Result: The result is `inf` or `nan`.
Fix: Always check before dividing.

Mistake: Using `math.random` without seeding.

Result: In older Lua, the same numbers each run.
Fix: In Roblox, use `Random.new()` instead.

Mistake: Expecting `math.floor` to round.

Result: `math.floor(3.9)` is 3, not 4.
Fix: Use the round function from this lesson.

---

## Summary

- `+`, `-`, `*`, `/` are the basic operators
- `%` gives the remainder
- `^` gives a power
- Order of operations is standard math
- `math.floor` rounds down
- `math.ceil` rounds up
- `math.abs` removes the sign
- `math.max` and `math.min` find the largest or smallest
- `math.sqrt` gives the square root
- `math.random` gives random numbers
- Use `Random.new()` in Roblox for better randomness

Math is in every game.
Master it and everything else gets easier.

---

## Files in This Lesson

- [code/arithmetic.lua](code/arithmetic.lua) - basic operators
- [code/random.lua](code/random.lua) - random numbers
- [code/math-functions.lua](code/math-functions.lua) - the math library
- [challenge.md](challenge.md) - your exercise

---

Next: [code/arithmetic.lua](code/arithmetic.lua)
