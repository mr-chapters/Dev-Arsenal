
# 09 - Metatables

In this lesson you will learn how to give tables special powers.

You will learn:

- What a metatable is
- How to attach one to a table
- The `__index` metamethod
- How to build object oriented code
- Other useful metamethods

Metatables are how Lua does object oriented programming.
Every class in Roblox uses metatables under the hood.

---

## What Is a Metatable

A metatable is a regular table that changes the behavior of another table.

You attach it with `setmetatable`.

```lua
local myTable = {}
local myMetatable = {}

setmetatable(myTable, myMetatable)
```

Now `myTable` has a metatable.
The metatable can define special keys that change how `myTable` behaves.

These special keys start with two underscores.

They are called metamethods.

---

## The __index Metamethod

The most important metamethod is `__index`.

When you access a key that does not exist in a table, Lua looks in the metatable's `__index`.

```lua
local defaults = {health = 100, mana = 50}
local player = setmetatable({}, {__index = defaults})

print(player.health)     -- 100
print(player.mana)       -- 50
```

The `player` table is empty.
But when you ask for `health`, Lua looks in `defaults` and finds it.

---

## How __index Works

```text
1. Look in the table itself
2. Not found? Look in the metatable's __index
3. Still not found? Return nil
```

This is how inheritance works in Lua.

---

## Object Oriented Programming

The pattern is:

```lua
local Animal = {}
Animal.__index = Animal

function Animal.new(name)
    local self = setmetatable({}, Animal)
    self.name = name
    return self
end

function Animal:speak()
    print(self.name .. " makes a sound")
end
```

Now you can create animals:

```lua
local cat = Animal.new("Cat")
cat:speak()
```

Output:

```text
Cat makes a sound
```

---

## How the Pattern Works

Step by step:

1. Create a table `Animal`.
2. Set `Animal.__index = Animal`.
3. Define `Animal.new` which uses `setmetatable`.
4. Define methods like `Animal:speak`.
5. Use `Animal.new()` to make new instances.

The colon `:` in `function Animal:speak()` is shorthand for:

```lua
function Animal.speak(self)
```

The `self` is the instance that calls the method.

---

## A Complete Example

```lua
local Player = {}
Player.__index = Player

function Player.new(name, level)
    local self = setmetatable({}, Player)
    self.name = name
    self.level = level
    self.health = 100
    self.coins = 0
    return self
end

function Player:takeDamage(amount)
    self.health = self.health - amount
    if self.health < 0 then
        self.health = 0
    end
    print(self.name .. " took " .. amount .. " damage. HP: " .. self.health)
end

function Player:addCoins(amount)
    self.coins = self.coins + amount
    print(self.name .. " now has " .. self.coins .. " coins")
end

function Player:isAlive()
    return self.health > 0
end

local alex = Player.new("Alex", 5)
alex:takeDamage(30)
alex:addCoins(50)
print("Alive: " .. tostring(alex:isAlive()))
```

Output:

```text
Alex took 30 damage. HP: 70
Alex now has 50 coins
Alive: true
```

---

## Adding a Second Class

You can have many classes.

```lua
local Enemy = {}
Enemy.__index = Enemy

function Enemy.new(name, health, damage)
    local self = setmetatable({}, Enemy)
    self.name = name
    self.health = health
    self.damage = damage
    return self
end

function Enemy:attack(target)
    print(self.name .. " attacks " .. target.name)
    target:takeDamage(self.damage)
end

local goblin = Enemy.new("Goblin", 30, 10)
goblin:attack(alex)
```

Output:

```text
Goblin attacks Alex
Alex took 10 damage. HP: 60
```

---

## Inheritance

A class can inherit from another.

```lua
local Animal = {}
Animal.__index = Animal

function Animal.new(name)
    local self = setmetatable({}, Animal)
    self.name = name
    return self
end

function Animal:speak()
    print(self.name .. " makes a sound")
end

-- Dog inherits from Animal
local Dog = setmetatable({}, {__index = Animal})
Dog.__index = Dog

function Dog.new(name)
    local self = setmetatable({}, Dog)
    self.name = name
    return self
end

function Dog:speak()
    print(self.name .. " barks")
end

local dog = Dog.new("Rex")
dog:speak()       -- Rex barks
```

The `setmetatable({}, {__index = Animal})` makes Dog inherit from Animal.

---

## Other Useful Metamethods

### __tostring

Called when you use `tostring()` or `print()` on the table.

```lua
local Player = {}
Player.__index = Player

Player.__tostring = function(self)
    return "Player: " .. self.name
end

local p = setmetatable({name = "Alex"}, Player)
print(p)     -- Player: Alex
```

### __add, __sub, __mul

Called when you use math operators.

```lua
local Vector = {}
Vector.__index = Vector

Vector.__add = function(a, b)
    return setmetatable({x = a.x + b.x, y = a.y + b.y}, Vector)
end

local v1 = setmetatable({x = 1, y = 2}, Vector)
local v2 = setmetatable({x = 3, y = 4}, Vector)

local v3 = v1 + v2
print(v3.x, v3.y)     -- 4  6
```

### __eq

Called when you use `==`.

```lua
local Point = {}
Point.__index = Point

Point.__eq = function(a, b)
    return a.x == b.x and a.y == b.y
end

local p1 = setmetatable({x = 1, y = 2}, Point)
local p2 = setmetatable({x = 1, y = 2}, Point)

print(p1 == p2)     -- true
```

### __call

Called when you use the table like a function.

```lua
local Counter = {}
Counter.__index = Counter

Counter.__call = function(self)
    self.count = (self.count or 0) + 1
    return self.count
end

local c = setmetatable({}, Counter)

print(c())     -- 1
print(c())     -- 2
print(c())     -- 3
```

---

## A Clean Class Template

Here is a template you can copy for any class.

```lua
local MyClass = {}
MyClass.__index = MyClass

function MyClass.new(...)
    local self = setmetatable({}, MyClass)
    -- set up fields here
    return self
end

function MyClass:method()
    -- use self.fieldName
end

return MyClass
```

Save this in a ModuleScript and require it from other scripts.

---

## Why This Matters

Every Roblox system you will build uses this pattern.

- Players
- Enemies
- Tools
- UI screens
- Inventory slots
- Quests

All of them are classes.

Once you understand metatables, you can build anything.

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
local Player = {}
Player.__index = Player

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    self.health = 100
    return self
end

function Player:takeDamage(amount)
    self.health = self.health - amount
    print(self.name .. " HP: " .. self.health)
end

local alex = Player.new("Alex")
alex:takeDamage(20)
alex:takeDamage(30)
```

Press F5.
Check the Output window.

Now add a `heal` method.
Add more players.
Run it again.
See how the output changes.

---

## Common Mistakes

Mistake: Forgetting `__index = ClassName`.

Result: Methods are not found. Error.

```lua
local Player = {}
-- forgot Player.__index = Player
```

Mistake: Forgetting `setmetatable` in the constructor.

Result: Instance does not inherit methods.

```lua
function Player.new()
    return {}     -- forgot setmetatable
end
```

Mistake: Using `.` instead of `:` when calling methods.

```lua
alex.takeDamage(20)     -- ERROR, self is missing
alex:takeDamage(20)     -- OK
```

Mistake: Forgetting `self` in the method body.

```lua
function Player:takeDamage(amount)
    health = health - amount     -- ERROR, no self
end
```

Fix:

```lua
self.health = self.health - amount
```

Mistake: Defining methods with `.` but calling with `:`.

Pick one style and stick with it.
The standard is `function Class:method()`.

---

## Summary

- A metatable changes how another table behaves
- `setmetatable(t, meta)` attaches one
- `__index` is used for inheritance
- The class pattern uses `setmetatable` and `__index`
- `:` is shorthand for passing `self`
- Other metamethods customize operators and printing
- Every Roblox class uses this pattern
- Save class templates in ModuleScripts

You now know how to build real objects.
This is the foundation of every Roblox game.

---

## Files in This Lesson

- [code/basics.lua](code/basics.lua) - the __index metamethod
- [code/oop.lua](code/oop.lua) - object oriented programming
- [code/__index.lua](code/__index.lua) - deep dive on __index
- [challenge.md](challenge.md) - your exercise

---

Next: [code/basics.md](code/basics.md)
