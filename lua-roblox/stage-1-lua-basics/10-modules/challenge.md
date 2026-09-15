# Challenge 10 - Modules

This is your exercise for Lesson 10.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that uses a module to organize your code.

The script must:

- Create at least one ModuleScript
- Return a table from the module
- Add at least three functions to the module
- Require the module from another script
- Call each function at least once
- Use `WaitForChild` when requiring

---

## Step by Step

1. Open Roblox Studio
2. In the Explorer, click ReplicatedStorage
3. Right-click it and choose Insert Object, then ModuleScript
4. Name it `MathUtils`
5. Delete the default code and write the module
6. Click ServerScriptService
7. Right-click it and choose Insert Object, then Script
8. Delete the default code and write the test script
9. Press F5 to play
10. Check the Output window (press F9)

---

## Expected Output

When your script runs, the Output window should show something like:

```text
=== MathUtils Test ===

add(2, 3) = 5
subtract(10, 4) = 6
multiply(4, 5) = 20
divide(20, 4) = 5
double(7) = 14
square(5) = 25
clamp(15, 0, 10) = 10
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your module must include:

- A table called `MathUtils`
- At least four functions
- A `return MathUtils` at the end

Your test script must include:

- `local ReplicatedStorage = game:GetService("ReplicatedStorage")`
- `require` with `WaitForChild`
- At least four calls to the module
- At least four print statements

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Create a second module called `StringUtils`.
Add functions like `capitalize`, `repeat`, `reverse`.

### Bonus 2

Create a `Config` module with constants for your game.

```lua
local Config = {}
Config.GAME_NAME = "My Game"
Config.MAX_PLAYERS = 12
Config.MAX_HEALTH = 100
return Config
```

Require it and print the values.

### Bonus 3

Create a `Player` class module.

```lua
local Player = {}
Player.__index = Player

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end

return Player
```

Require it and create two players.

### Bonus 4

Create a module that keeps a shared counter.

```lua
local Counter = {}
Counter.value = 0

function Counter.increment()
    Counter.value = Counter.value + 1
    return Counter.value
end

return Counter
```

Require it from two different scripts.
See if they share the same value.

### Bonus 5

Create a `LootTable` module that picks a random item.

```lua
local LootTable = {}

LootTable.items = {
    {name = "Common", weight = 70},
    {name = "Rare", weight = 25},
    {name = "Legendary", weight = 5}
}

function LootTable.roll() ... end

return LootTable
```

### Bonus 6

Create a `Utils` module with helper functions.
Add `round`, `clamp`, `formatNumber`, and any others you find useful.

---

## Hints

Hint for a module:

```lua
local MathUtils = {}

function MathUtils.add(a, b)
    return a + b
end

return MathUtils
```

Hint for requiring:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MathUtils = require(ReplicatedStorage:WaitForChild("MathUtils"))
```

Hint for calling a module function:

```lua
print(MathUtils.add(2, 3))
```

Hint for a shared counter:

```lua
local Counter = {}
Counter.value = 0

function Counter.increment()
    Counter.value = Counter.value + 1
    return Counter.value
end

return Counter
```

Hint for a config module:

```lua
local Config = {}
Config.MAX_HEALTH = 100
Config.STARTING_COINS = 0
return Config
```

Hint for a class module:

```lua
local Player = {}
Player.__index = Player

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end

return Player
```

---

## Common Mistakes to Avoid

- Forgetting `return` at the end of the module
- Forgetting `WaitForChild` when requiring
- Requiring the wrong object (not a ModuleScript)
- Using a module in ServerStorage from the client
- Calling `require` twice expecting fresh data
- Naming the module and the variable differently
- Forgetting to press F5 to run the script

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Creating a ModuleScript
- Returning a table from a module
- Adding functions to the module
- Requiring the module from another script
- Calling module functions
- Using WaitForChild

---

## Checklist

- [ ] I created a ModuleScript in ReplicatedStorage
- [ ] My module returns a table
- [ ] My module has at least four functions
- [ ] I wrote a test script in ServerScriptService
- [ ] I used require with WaitForChild
- [ ] I called at least four module functions
- [ ] The script runs without errors
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [11 - Coroutines](../11-coroutines/README.md).

---

Next: [11 - Coroutines](../11-coroutines/README.md)
