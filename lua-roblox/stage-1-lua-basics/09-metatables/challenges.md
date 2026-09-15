
# Challenge 09 - Metatables

This is your exercise for Lesson 09.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that uses metatables to create an object with methods.

The script must:

- Create at least one class using the metatable pattern
- Set `__index` on the class
- Write a `new` function
- Write at least three methods
- Create at least two instances of the class
- Call methods on each instance

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
=== Player 1 ===
Alex has 100 HP
Alex took 30 damage. HP: 70
Alex healed 20. HP: 90
Alex has 50 coins

=== Player 2 ===
Bob has 100 HP
Bob took 50 damage. HP: 50
Bob has 25 coins
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- One class defined with `local Class = {}`
- The line `Class.__index = Class`
- A `Class.new()` constructor using `setmetatable`
- At least three methods defined with `:`
- At least two instances created
- At least one method that changes a value
- At least one method that returns a value

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Add a `__tostring` metamethod so the class prints nicely.

```lua
print(player)     -- Player: Alex (HP 90)
```

### Bonus 2

Create a second class and have one instance interact with the other.

```lua
local goblin = Enemy.new("Goblin", 30, 10)
goblin:attack(player)
```

### Bonus 3

Make a class inherit from another.

```lua
local Animal = {}
-- ...

local Dog = setmetatable({}, {__index = Animal})
```

### Bonus 4

Add an `__eq` metamethod so two objects can be compared with `==`.

### Bonus 5

Add a `__add` metamethod that combines two objects.

```lua
local v3 = v1 + v2
```

### Bonus 6

Build a small inventory class.

```lua
local Inventory = {}
-- addItem, removeItem, hasItem, list
```

---

## Hints

Hint for a class template:

```lua
local Player = {}
Player.__index = Player

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end
```

Hint for a method:

```lua
function Player:sayHello()
    print("Hello, " .. self.name)
end
```

Hint for calling:

```lua
local p = Player.new("Alex")
p:sayHello()
```

Hint for a value-changing method:

```lua
function Player:takeDamage(amount)
    self.health = self.health - amount
end
```

Hint for a returning method:

```lua
function Player:isAlive()
    return self.health > 0
end
```

Hint for `__tostring`:

```lua
Player.__tostring = function(self)
    return "Player: " .. self.name
end
```

Hint for inheritance:

```lua
local Dog = setmetatable({}, {__index = Animal})
Dog.__index = Dog
```

Hint for using a class in another class:

```lua
function Enemy:attack(target)
    target:takeDamage(self.damage)
end
```

---

## Common Mistakes to Avoid

- Forgetting `Player.__index = Player`
- Forgetting `setmetatable` in the constructor
- Using `.` instead of `:` when calling methods
- Forgetting `self` inside methods
- Defining `new` with a colon instead of a dot
- Returning the wrong thing from `new`
- Forgetting to press F5 to run the script

### Important Reminder

`new` is defined with a dot:

```lua
function Player.new(name)     -- dot
```

Other methods are defined with a colon:

```lua
function Player:speak()       -- colon
```

The reason: `new` is called on the class itself. Methods are called on instances.

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Creating a class with the metatable pattern
- Writing a constructor
- Writing methods
- Using `self`
- Creating multiple instances
- Calling methods on instances

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I created a class with `__index`
- [ ] I wrote a `new` constructor with `setmetatable`
- [ ] I wrote at least three methods
- [ ] I created two instances
- [ ] I called methods on both
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [10 - Modules](../10-modules/README.md).

---

Next: [10 - Modules](../10-modules/README.md)
