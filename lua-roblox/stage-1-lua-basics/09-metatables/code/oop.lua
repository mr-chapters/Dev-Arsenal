# oop.lua

Object oriented programming in Lua.

You build classes with metatables.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Class Pattern

```lua
local Player = {}
Player.__index = Player

function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end

function Player:speak()
    print("Hi, I am " .. self.name)
end

local alex = Player.new("Alex")
alex:speak()     -- Hi, I am Alex
```

---

## Breaking Down the Pattern

### 1. Create the class table

```lua
local Player = {}
```

### 2. Set `__index`

```lua
Player.__index = Player
```

This makes instances look up methods in `Player`.

### 3. Write the constructor

```lua
function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    return self
end
```

Notice the dot, not the colon.
`new` is called on the class itself.

### 4. Write methods

```lua
function Player:speak()
    print("Hi, I am " .. self.name)
end
```

Notice the colon.
Methods are called on instances.

### 5. Create instances

```lua
local alex = Player.new("Alex")
alex:speak()
```

---

## Why Dot for new and Colon for methods

`function Player.new(name)` is the same as:

```lua
function Player.new(Player, name)     -- Player is the first argument
```

`function Player:speak()` is the same as:

```lua
function Player.speak(self)
```

The colon passes the instance as the first argument.
The dot does not.

So `new` uses the dot because it is called on the class.
Other methods use the colon because they are called on instances.

---

## A Full Example: Player Class

```lua
local Player = {}
Player.__index = Player

function Player.new(name, level)
    local self = setmetatable({}, Player)
    self.name = name
    self.level = level
    self.health = 100
    self.maxHealth = 100
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

function Player:heal(amount)
    self.health = self.health + amount
    if self.health > self.maxHealth then
        self.health = self.maxHealth
    end
    print(self.name .. " healed " .. amount .. ". HP: " .. self.health)
end

function Player:addCoins(amount)
    self.coins = self.coins + amount
    print(self.name .. " now has " .. self.coins .. " coins")
end

function Player:isAlive()
    return self.health > 0
end

function Player:describe()
    print(self.name .. " (Level " .. self.level .. ")")
    print("  HP: " .. self.health .. " / " .. self.maxHealth)
    print("  Coins: " .. self.coins)
end

local alex = Player.new("Alex", 5)
alex:describe()
alex:takeDamage(30)
alex:heal(10)
alex:addCoins(50)
print("Alive: " .. tostring(alex:isAlive()))
```

Output:

```text
Alex (Level 5)
  HP: 100 / 100
  Coins: 0
Alex took 30 damage. HP: 70
Alex healed 10. HP: 80
Alex now has 50 coins
Alive: true
```

---

## A Second Class: Enemy

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
Alex took 10 damage. HP: 70
```

The enemy calls a method on the player.
This is how you build interactions.

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

function Animal:move()
    print(self.name .. " moves")
end
```

Now make a Dog:

```lua
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
```

The Dog class inherits `move` from Animal.
It overrides `speak`.

```lua
local dog = Dog.new("Rex")
dog:speak()     -- Rex barks
dog:move()      -- Rex moves
```

---

## Calling the Parent Method

If a method is overridden, you can still call the parent version.

```lua
function Dog:speak()
    Animal.speak(self)
    print("...actually it barks")
end
```

Output for `dog:speak()`:

```text
Rex makes a sound
...actually it barks
```

---

## Checking the Type

Use `getmetatable` to check what class an instance belongs to.

```lua
if getmetatable(dog) == Dog then
    print("It is a Dog")
end
```

You can also use a marker field:

```lua
Player.className = "Player"

if getmetatable(alex).className == "Player" then
    print("It is a Player")
end
```

---

## A Clean Template

Save this in a ModuleScript.

```lua
local MyClass = {}
MyClass.__index = MyClass

function MyClass.new(...)
    local self = setmetatable({}, MyClass)
    return self
end

return MyClass
```

Require it from other scripts and add methods.

---

## Real Roblox Example: Tool

```lua
local Tool = {}
Tool.__index = Tool

function Tool.new(name, damage, cooldown)
    local self = setmetatable({}, Tool)
    self.name = name
    self.damage = damage
    self.cooldown = cooldown
    self.lastUsed = 0
    return self
end

function Tool:canUse()
    return os.clock() - self.lastUsed >= self.cooldown
end

function Tool:use(target)
    if not self:canUse() then
        print(self.name .. " is on cooldown")
        return
    end
    self.lastUsed = os.clock()
    print("Used " .. self.name .. " for " .. self.damage .. " damage")
end

local sword = Tool.new("Sword", 25, 1)
sword:use()
sword:use()
```

The second use is blocked by cooldown.

---

## Common Mistakes

Mistake 1: Forgetting `__index`.

```lua
local Player = {}
-- missing Player.__index = Player
```

Methods will not be found.

Mistake 2: Forgetting `setmetatable` in `new`.

```lua
function Player.new(name)
    return {name = name}     -- no metatable, no methods
end
```

Mistake 3: Using a colon for `new`.

```lua
function Player:new(name)     -- passes Player as first argument
```

Use a dot for `new`.

Mistake 4: Using a dot for calling methods.

```lua
alex.speak()     -- ERROR, self is missing
alex:speak()     -- OK
```

Mistake 5: Forgetting `self` inside methods.

```lua
function Player:speak()
    print(name)     -- ERROR, name is not defined
end
```

Fix:

```lua
print(self.name)
```

---

## Summary

- Use `setmetatable` and `__index` to build classes
- `new` uses a dot. Methods use a colon
- `self` refers to the instance inside methods
- Inheritance uses `setmetatable({}, {__index = Parent})`
- You can override and extend parent methods
- Save class templates in ModuleScripts
- Every Roblox class uses this pattern
