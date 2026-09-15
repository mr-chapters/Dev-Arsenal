# Challenge 07 - Functions

This is your exercise for Lesson 07.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that uses functions to organize your code.

The script must:

- Define at least four functions
- Call each function at least once
- Pass at least one parameter into a function
- Return at least one value from a function
- Use one function inside another

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
=== Functions Demo ===

Greeting:
Hello, Alex

Sum:
5 + 3 = 8

Damage:
Base: 20
Multiplier: 1.5
Defense: 5
Final: 25

Health Bar:
[=======---]

Chance Roll:
Result: true
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- A function that takes no parameters
- A function that takes parameters
- A function that returns a value
- A function that returns more than one value
- A function that calls another function
- At least five print statements

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Write a function `isEven(n)` that returns true if `n` is even, false otherwise.

```lua
local function isEven(n)
    return n % 2 == 0
end

print(isEven(4))    -- true
print(isEven(7))    -- false
```

### Bonus 2

Write a function `max(a, b)` that returns the larger of the two numbers.

Do not use `math.max`. Write the logic yourself.

### Bonus 3

Write a function `clamp(value, minValue, maxValue)` that keeps a value in range.

```lua
print(clamp(5, 0, 10))     -- 5
print(clamp(-3, 0, 10))    -- 0
print(clamp(15, 0, 10))    -- 10
```

### Bonus 4

Write a function `repeatString(text, n)` that repeats a string n times.

Do not use `string.rep`. Write the loop yourself.

### Bonus 5

Write a function `getPlayerStats(name)` that returns the name, level, and coins as three separate values.

```lua
local name, level, coins = getPlayerStats("Alex")
print(name, level, coins)
```

### Bonus 6

Write a function that draws a health bar using a loop.

```lua
local function healthBar(current, max, bars)
    -- return a string like [=======---]
end

print(healthBar(75, 100, 10))
```

---

## Hints

Hint for a simple function:

```lua
local function greet()
    print("Hello")
end

greet()
```

Hint for a function with parameters:

```lua
local function greet(name)
    print("Hello, " .. name)
end

greet("Alex")
```

Hint for a function that returns:

```lua
local function add(a, b)
    return a + b
end

print(add(2, 3))
```

Hint for multiple returns:

```lua
local function getStats()
    return "Alex", 5, 100
end

local name, level, coins = getStats()
```

Hint for a function calling another:

```lua
local function double(n)
    return n + n
end

local function quadruple(n)
    return double(double(n))
end
```

Hint for isEven:

```lua
local function isEven(n)
    return n % 2 == 0
end
```

Hint for max:

```lua
local function max(a, b)
    if a > b then
        return a
    else
        return b
    end
end
```

---

## Common Mistakes to Avoid

- Forgetting `local` before `function`
- Forgetting `end` at the end of the function
- Forgetting `()` when calling the function
- Forgetting `return` when the function should give a value back
- Using the wrong number of arguments
- Calling a function before it is defined
- Putting a `return` after code that should still run

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Writing functions
- Calling functions
- Passing parameters
- Returning values
- Returning multiple values
- Functions calling other functions
- Organizing code with functions

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I defined at least four functions
- [ ] I used parameters
- [ ] I used return values
- [ ] I called one function inside another
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [08 - Tables](../08-tables/README.md).

---

Next: [08 - Tables](../08-tables/README.md)
