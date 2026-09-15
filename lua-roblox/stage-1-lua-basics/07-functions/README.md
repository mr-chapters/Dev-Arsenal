# 07 - Functions

In this lesson you will learn how to write reusable blocks of code.

You will learn:

- What a function is
- How to write one
- How to call one
- How to pass values in
- How to get values out
- The difference between local and global functions

Functions are how real code is organized.
Every game you have ever played is built out of thousands of functions.

---

## What Is a Function

A function is a named block of code that does one job.

You write it once. You call it many times.

Instead of copying the same 10 lines every time you need them, you write a function and call it.

This is the single biggest idea in programming.

---

## Your First Function

```lua
local function greet()
    print("Hello, Roblox!")
end
```

This defines a function called `greet`.
Nothing has happened yet. The code inside has not run.

To run it, you call it:

```lua
greet()
```

Output:

```text
Hello, Roblox!
```

The parentheses `()` are what "call" the function.

---

## The Pattern

```text
local function  name()
    -- code
end
```

- `local` makes the function local to the file
- `function` is the keyword
- `name` is what you want to call it
- `()` is where you put parameters
- `end` closes the function

---

## Calling a Function Many Times

```lua
local function greet()
    print("Hello!")
end

greet()
greet()
greet()
```

Output:

```text
Hello!
Hello!
Hello!
```

You write the function once, but you can call it as many times as you want.

---

## Parameters

You can pass values into a function.

```lua
local function greet(name)
    print("Hello, " .. name)
end

greet("Alex")
greet("Bob")
```

Output:

```text
Hello, Alex
Hello, Bob
```

The parameter `name` becomes the value you pass in.

- `greet("Alex")` makes `name` equal "Alex"
- `greet("Bob")` makes `name` equal "Bob"

---

## Multiple Parameters

```lua
local function add(a, b)
    print(a + b)
end

add(2, 3)       -- 5
add(10, 5)      -- 15
add(100, 200)   -- 300
```

Parameters are separated by commas.

---

## Returning Values

A function can send a value back.

```lua
local function add(a, b)
    return a + b
end

local result = add(2, 3)
print(result)     -- 5
```

The `return` keyword sends the value back to whoever called the function.

You can use it directly:

```lua
print(add(2, 3))       -- 5
print(add(10, 5) * 2)  -- 30
```

---

## Return Ends the Function

When Lua hits a `return`, the function stops immediately.

```lua
local function check(n)
    if n < 0 then
        return "negative"
    end
    return "positive"
end

print(check(-5))   -- negative
print(check(5))    -- positive
```

Everything after the return is skipped.

---

## Multiple Returns

Lua functions can return more than one value.

```lua
local function getCoordinates()
    return 10, 20, 30
end

local x, y, z = getCoordinates()
print(x, y, z)     -- 10  20  30
```

This is common in Roblox for things like hit detection.

---

## No Return

If a function does not use `return`, it returns `nil` by default.

```lua
local function sayHi()
    print("Hi")
end

local result = sayHi()   -- prints Hi
print(result)            -- nil
```

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

print(calculateDamage(20, 1.5, 5))    -- 25
print(calculateDamage(30, 2, 10))     -- 50
print(calculateDamage(5, 1, 20))      -- 0
```

Write once. Use everywhere.

---

## A Real Example: Health Bar

```lua
local function drawHealthBar(current, max)
    local bars = 10
    local filled = math.floor((current / max) * bars)
    local bar = "["
    for i = 1, bars do
        if i <= filled then
            bar = bar .. "="
        else
            bar = bar .. "-"
        end
    end
    bar = bar .. "]"
    return bar
end

print(drawHealthBar(75, 100))   -- [=======---]
print(drawHealthBar(25, 100))   -- [==--------]
print(drawHealthBar(100, 100))  -- [==========]
```

---

## A Real Example: Chance Roll

```lua
local function rollChance(percent)
    return math.random(1, 100) <= percent
end

if rollChance(25) then
    print("Rare item dropped")
else
    print("No drop")
end
```

---

## Local vs Global Functions

```lua
local function localFunc()      -- only in this file
    print("local")
end

function globalFunc()            -- available everywhere
    print("global")
end
```

Always use `local` unless you have a reason not to.

Same rule as variables.

---

## Default Arguments

Lua does not have built-in default arguments.
But you can fake them with `or`.

```lua
local function greet(name)
    name = name or "Guest"
    print("Hello, " .. name)
end

greet("Alex")    -- Hello, Alex
greet()          -- Hello, Guest
```

If `name` is nil, the `or` falls back to "Guest".

---

## Functions Calling Functions

A function can call another function.

```lua
local function add(a, b)
    return a + b
end

local function double(n)
    return add(n, n)
end

print(double(5))     -- 10
```

This is how you build complex behavior from small pieces.

---

## Functions Inside Functions

You can define a function inside another.

```lua
local function outer()
    local function inner()
        print("inside")
    end

    inner()
end

outer()
```

The inner function is only available inside the outer one.

---

## Anonymous Functions

You can write functions without names.

```lua
local greet = function(name)
    print("Hello, " .. name)
end

greet("Alex")
```

This is the same as:

```lua
local function greet(name)
    print("Hello, " .. name)
end
```

Both work. The first style is used for passing functions as arguments.

---

## Common Mistakes

Mistake: Calling the function before defining it.

```lua
greet()       -- ERROR, greet is not defined yet

local function greet()
    print("Hi")
end
```

Fix: Define first, call later.

Mistake: Forgetting the `()` when calling.

```lua
greet          -- does nothing, just references the function
greet()        -- calls it
```

Mistake: Forgetting `return`.

```lua
local function add(a, b)
    a + b     -- ERROR, no return
end

print(add(2, 3))     -- nil
```

Fix: Add `return`.

Mistake: Calling with wrong number of arguments.

```lua
local function add(a, b)
    return a + b
end

add(5)         -- b is nil, error
add(5, 10)     -- OK
```

Mistake: Using a local function after the `end`.

```lua
local function foo()
end

foo()          -- OK, foo is still in scope
```

Local functions are available in the file after they are defined.

---

## Summary

- A function is a named block of code
- Use `local function name() ... end` to define one
- Use `name()` to call it
- Parameters pass values in
- `return` sends values out
- Functions can return multiple values
- Functions can call other functions
- Use `local` for functions just like variables
- Write once, call many times

Functions are how you keep your code clean.
Every script you write from now on will use them.

---

## Files in This Lesson

- [code/basic.lua](code/basic.lua) - simple functions
- [code/params.lua](code/params.lua) - passing arguments
- [code/return.lua](code/return.lua) - returning values
- [challenge.md](challenge.md) - your exercise

---

Next: [code/basic.md](code/basic.md)
