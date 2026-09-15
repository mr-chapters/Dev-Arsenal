# basic.lua

Basic functions in Lua.

A function is a named block of code you can call many times.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## Defining a Function

Use `local function` to define one.

```lua
local function greet()
    print("Hello, Roblox!")
end
```

The code inside does not run yet.
It only runs when you call the function.

---

## Calling a Function

Add `()` after the name.

```lua
greet()
```

Output:

```text
Hello, Roblox!
```

The parentheses are what tell Lua to run the function.

---

## Calling Many Times

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

Write once, call many times.

---

## A Function That Says Your Name

```lua
local function sayName()
    local name = "Alex"
    print("My name is " .. name)
end

sayName()
```

Output:

```text
My name is Alex
```

---

## A Function That Draws a Line

```lua
local function drawLine()
    print("=":rep(30))
end

drawLine()
print("Section 1")
drawLine()
print("Section 2")
drawLine()
```

Output:

```text
==============================
Section 1
==============================
Section 2
==============================
```

Handy for formatting output.

---

## A Function That Counts

```lua
local function countToFive()
    for i = 1, 5 do
        print(i)
    end
end

countToFive()
```

Output:

```text
1
2
3
4
5
```

---

## A Function That Rolls a Die

```lua
local function rollDie()
    local roll = math.random(1, 6)
    print("You rolled a " .. roll)
end

rollDie()
rollDie()
rollDie()
```

Each call gives a different result.

---

## Calling a Function Inside Another

```lua
local function greet()
    print("Hello")
end

local function startGame()
    greet()
    print("Game starting")
end

startGame()
```

Output:

```text
Hello
Game starting
```

---

## Defining Functions After Using Them

A function must be defined before it is called.

This works:

```lua
local function hi()
    print("hi")
end

hi()
```

This does not:

```lua
hi()      -- ERROR, hi is not defined yet

local function hi()
    print("hi")
end
```

Always define first, call later.

---

## Local vs Global Functions

```lua
local function localFunc()
    print("I am local")
end

function globalFunc()
    print("I am global")
end
```

Always use `local` unless you have a specific reason not to.

This keeps your code safe from naming conflicts.

---

## Summary

- Use `local function name() ... end` to define
- Use `name()` to call
- Functions can call other functions
- Define the function before calling it
- Use `local` for all functions
