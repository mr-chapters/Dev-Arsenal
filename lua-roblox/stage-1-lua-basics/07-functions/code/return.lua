# return.lua

Returning values from functions in Lua.

A function can send a value back to whoever called it.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The return Keyword

Use `return` to send a value back.

```lua
local function add(a, b)
    return a + b
end

local result = add(2, 3)
print(result)
```

Output:

```text
5
```

The value `5` is sent back and stored in `result`.

---

## Using the Return Value Directly

You do not have to store it first.

```lua
local function add(a, b)
    return a + b
end

print(add(2, 3))          -- 5
print(add(10, 5) * 2)     -- 30
print(add(add(1, 2), 3))  -- 6
```

You can use the result anywhere a value is expected.

---

## Return Ends the Function

When Lua hits `return`, the function stops immediately.

```lua
local function check(n)
    if n < 0 then
        return "negative"
    end
    return "positive"
end

print(check(-5))     -- negative
print(check(5))      -- positive
```

Nothing after the return runs.

```lua
local function example()
    print("first")
    return
    print("never runs")     -- skipped
end

example()
```

Output:

```text
first
```

---

## Returning Nothing

If a function has no return, it returns nil.

```lua
local function sayHi()
    print("Hi")
end

local result = sayHi()   -- prints Hi
print(result)            -- nil
```

---

## Returning Early

You can return early to stop a function.

```lua
local function divide(a, b)
    if b == 0 then
        return "cannot divide by zero"
    end
    return a / b
end

print(divide(10, 2))     -- 5
print(divide(10, 0))     -- cannot divide by zero
```

This pattern is very common for validation.

---

## Multiple Returns

Lua functions can return more than one value.

```lua
local function getCoordinates()
    return 10, 20, 30
end

local x, y, z = getCoordinates()
print(x, y, z)
```

Output:

```text
10  20  30
```

---

## Using Multiple Returns Directly

```lua
local function minMax(numbers)
    local min = numbers[1]
    local max = numbers[1]
    for _, n in ipairs(numbers) do
        if n < min then min = n end
        if n > max then max = n end
    end
    return min, max
end

local low, high = minMax({5, 2, 9, 1, 7})
print("Min:", low)
print("Max:", high)
```

Output:

```text
Min: 1
Max: 9
```

---

## Ignoring Return Values

If you do not need a value, use `_`.

```lua
local function getThree()
    return 1, 2, 3
end

local first, _, third = getThree()
print(first, third)      -- 1  3
```

The `_` is a convention meaning "I do not care about this value".

---

## Returning a Table

Functions often return tables with many values.

```lua
local function makePlayer(name, level)
    return {
        name = name,
        level = level,
        health = 100,
        coins = 0
    }
end

local player = makePlayer("Alex", 5)
print(player.name)       -- Alex
print(player.level)      -- 5
print(player.health)     -- 100
```

---

## Returning a Function

A function can return another function.

```lua
local function makeGreeter(greeting)
    return function(name)
        print(greeting .. ", " .. name)
    end
end

local sayHello = makeGreeter("Hello")
local sayHi = makeGreeter("Hi")

sayHello("Alex")     -- Hello, Alex
sayHi("Bob")         -- Hi, Bob
```

This is called a closure.
You will learn more about it in later lessons.

---

## A Real Example: Damage Calculator

```lua
local function calculateDamage(base, multiplier, defense)
    local raw = base * multiplier
    local final = raw - defense
    if final < 0 then
        final = 0
    end
    return final
end

local damage = calculateDamage(20, 1.5, 5)
print("Damage: " .. damage)     -- Damage: 25
```

---

## A Real Example: Health Bar

```lua
local function healthBar(current, max, bars)
    local filled = math.floor((current / max) * bars)
    local text = "["
    for i = 1, bars do
        if i <= filled then
            text = text .. "="
        else
            text = text .. "-"
        end
    end
    text = text .. "]"
    return text
end

print(healthBar(75, 100, 10))    -- [=======---]
print(healthBar(25, 100, 10))    -- [==--------]
print(healthBar(100, 100, 10))   -- [==========]
```

---

## A Real Example: Chance Roll

```lua
local function rollChance(percent)
    return math.random(1, 100) <= percent
end

if rollChance(25) then
    print("Rare drop")
else
    print("No drop")
end
```

---

## Chaining Returns

You can chain function calls.

```lua
local function add(a, b)
    return a + b
end

local function double(n)
    return n * 2
end

print(double(add(2, 3)))     -- 10
```

The result of `add` is passed directly into `double`.

---

## Common Mistakes

Mistake 1: Forgetting return.

```lua
local function add(a, b)
    a + b     -- no return
end

print(add(2, 3))     -- nil
```

Fix: Use `return a + b`.

Mistake 2: Adding code after return.

```lua
local function f()
    return 5
    print("never runs")
end
```

The print line is skipped.

Mistake 3: Returning too many values when only one is needed.

```lua
local x = getCoordinates()     -- x is only the first value
local x, y, z = getCoordinates()   -- captures all three
```

Mistake 4: Using a return value that does not exist.

```lua
local function doNothing()
end

local value = doNothing()
print(value)     -- nil
```

Mistake 5: Returning after a loop with break.

```lua
local function findItem(list, target)
    for i, item in ipairs(list) do
        if item == target then
            return i     -- returns as soon as found
        end
    end
    return nil
end
```

The return inside the loop exits the whole function.

---

## Summary

- `return` sends a value back
- The function stops immediately after return
- Functions without return give back nil
- Return early for validation
- Functions can return multiple values
- Use `_` to ignore values
- Return tables for structured data
- Return functions for closures
