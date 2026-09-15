# basics.lua

Metatables in Lua.

A metatable changes how a table behaves.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## Creating a Metatable

A metatable is a regular table.

```lua
local meta = {}
```

You attach it to another table with `setmetatable`.

```lua
local myTable = {}
setmetatable(myTable, meta)
```

Now `myTable` has a metatable.

---

## Reading the Metatable

```lua
local meta = {}
local myTable = setmetatable({}, meta)

print(getmetatable(myTable) == meta)     -- true
```

Use `getmetatable` to check.

---

## The __index Metamethod

The most important metamethod.

```lua
local defaults = {health = 100, mana = 50}
local player = setmetatable({}, {__index = defaults})

print(player.health)     -- 100
print(player.mana)       -- 50
print(player.speed)      -- nil
```

When Lua cannot find a key in the table, it looks in `__index`.

---

## __index as a Function

```lua
local player = setmetatable({}, {
    __index = function(t, key)
        print("Missing key: " .. key)
        return "unknown"
    end
})

print(player.health)
```

Output:

```text
Missing key: health
unknown
```

---

## __tostring

Called when you `print()` or `tostring()` the table.

```lua
local player = {name = "Alex"}
setmetatable(player, {
    __tostring = function(self)
        return "Player: " .. self.name
    end
})

print(player)     -- Player: Alex
```

Without `__tostring`, printing a table shows something like `table: 0x...`.

---

## __add

Called when you add two tables with `+`.

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

---

## __sub, __mul, __div

The same idea for other math operators.

```lua
local Num = {}
Num.__index = Num

Num.__sub = function(a, b)
    return setmetatable({value = a.value - b.value}, Num)
end

local a = setmetatable({value = 10}, Num)
local b = setmetatable({value = 3}, Num)

local c = a - b
print(c.value)     -- 7
```

---

## __eq

Called when you compare two tables with `==`.

```lua
local Point = {}
Point.__index = Point

Point.__eq = function(a, b)
    return a.x == b.x and a.y == b.y
end

local p1 = setmetatable({x = 1, y = 2}, Point)
local p2 = setmetatable({x = 1, y = 2}, Point)
local p3 = setmetatable({x = 5, y = 9}, Point)

print(p1 == p2)     -- true
print(p1 == p3)     -- false
```

Without `__eq`, two tables are only equal if they are the same table.

---

## __lt and __le

Called when you compare with `<` and `<=`.

```lua
local Version = {}
Version.__index = Version

Version.__lt = function(a, b)
    return a.number < b.number
end

local v1 = setmetatable({number = 1}, Version)
local v2 = setmetatable({number = 2}, Version)

print(v1 < v2)     -- true
```

---

## __len

Called when you use `#` on the table.

```lua
local Bag = {}
Bag.__index = Bag

Bag.__len = function(self)
    return #self.items
end

local bag = setmetatable({items = {"apple", "banana"}}, Bag)
print(#bag)     -- 2
```

---

## __call

Called when you use the table like a function.

```lua
local Counter = {}
Counter.__index = Counter

Counter.__call = function(self, add)
    self.count = (self.count or 0) + add
    return self.count
end

local c = setmetatable({}, Counter)

print(c(5))     -- 5
print(c(3))     -- 8
print(c(2))     -- 10
```

---

## __newindex

Called when you assign a new key to the table.

```lua
local protected = setmetatable({}, {
    __newindex = function(t, key, value)
        print("Blocked: cannot set " .. key)
    end
})

protected.health = 100
```

Output:

```text
Blocked: cannot set health
```

The value is not stored.

---

## A List of Common Metamethods

| Metamethod | When It Runs |
|-----------|--------------|
| __index | Missing key lookup |
| __newindex | Setting a new key |
| __tostring | print() or tostring() |
| __len | # operator |
| __call | Using the table like a function |
| __add | + operator |
| __sub | - operator |
| __mul | * operator |
| __div | / operator |
| __mod | % operator |
| __pow | ^ operator |
| __eq | == operator |
| __lt | < operator |
| __le | <= operator |
| __concat | .. operator |

---

## A Small Example: Protected Table

```lua
local function protect(t)
    return setmetatable({}, {
        __index = t,
        __newindex = function()
            error("This table is read only")
        end
    })
end

local constants = protect({MAX_HEALTH = 100})

print(constants.MAX_HEALTH)     -- 100
constants.MAX_HEALTH = 50       -- ERROR
```

---

## Common Mistakes

Mistake: Forgetting `setmetatable`.

```lua
local t = {}
t.__index = t     -- sets a key, does not set a metatable
```

Fix: Use `setmetatable`.

Mistake: Using the wrong key name.

The metamethod names start with two underscores.

```lua
__index     -- correct
_index      -- wrong
index_      -- wrong
```

Mistake: Confusing the metatable with the table it changes.

```lua
local t = {}
local meta = {}
setmetatable(t, meta)     -- meta is the metatable, t is the table
```

Mistake: Setting a metatable on the metatable by mistake.

Mistake: Thinking metamethods are called every time.

They are only called in specific situations.

---

## Summary

- A metatable changes how a table behaves
- Use `setmetatable` and `getmetatable`
- `__index` is for inheritance
- `__tostring` customizes printing
- `__add`, `__sub`, `__mul`, `__div` customize math
- `__eq`, `__lt`, `__le` customize comparisons
- `__len` customizes `#`
- `__call` lets a table be called like a function
- `__newindex` controls setting new keys
