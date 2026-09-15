
# math-functions.lua

```lua
-- math-functions.lua
-- Lesson 04 - Math
-- The math library in Lua.
--
-- The math library has many useful functions.
-- You call them with math.functionName().
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- math.floor
-- ============================================

-- Rounds a number DOWN to the nearest whole number.

print(math.floor(3.1))     -- 3
print(math.floor(3.9))     -- 3
print(math.floor(3.5))     -- 3
print(math.floor(-1.5))    -- -2
print(math.floor(10))      -- 10

-- Common use: making positions snap to a grid.


-- ============================================
-- math.ceil
-- ============================================

-- Rounds a number UP to the nearest whole number.

print(math.ceil(3.1))      -- 4
print(math.ceil(3.9))      -- 4
print(math.ceil(3.0))      -- 3
print(math.ceil(-1.5))     -- -1

-- Common use: calculating how many pages or slots you need.


-- ============================================
-- math.abs
-- ============================================

-- Returns the absolute value (positive version).

print(math.abs(-5))        -- 5
print(math.abs(5))         -- 5
print(math.abs(-3.14))     -- 3.14
print(math.abs(0))         -- 0

-- Common use: calculating distance between two numbers.


-- ============================================
-- math.max
-- ============================================

-- Returns the largest of the arguments.

print(math.max(1, 5, 3))        -- 5
print(math.max(10, 20, 30))     -- 30
print(math.max(-1, -5, -3))     -- -1
print(math.max(7, 7, 7))        -- 7

-- Common use: capping a value so it never goes below a limit.


-- ============================================
-- math.min
-- ============================================

-- Returns the smallest of the arguments.

print(math.min(1, 5, 3))        -- 1
print(math.min(10, 20, 30))     -- 10
print(math.min(-1, -5, -3))     -- -5

-- Common use: capping a value so it never goes above a limit.


-- ============================================
-- math.sqrt
-- ============================================

-- Returns the square root.

print(math.sqrt(16))       -- 4
print(math.sqrt(25))       -- 5
print(math.sqrt(100))      -- 10
print(math.sqrt(2))        -- 1.4142135623731

-- Common use: calculating distance between two points.


-- ============================================
-- math.pow
-- ============================================

-- Raises a number to a power.
-- Same as using the ^ operator.

print(math.pow(2, 3))      -- 8
print(math.pow(5, 2))      -- 25
print(math.pow(9, 0.5))    -- 3

-- Preferred style: use the ^ operator instead.


-- ============================================
-- math.huge
-- ============================================

-- A special value that means infinity.

print(math.huge)           -- inf
print(-math.huge)          -- -inf
print(1 / math.huge)       -- 0

-- Common use: starting a minimum search with an impossibly high value.


-- ============================================
-- math.pi
-- ============================================

-- The value of pi (3.1415926535898).

print(math.pi)             -- 3.1415926535898

-- Common use: angle calculations in 3D space.


-- ============================================
-- COMBINING FUNCTIONS
-- ============================================

-- You can nest them.

print(math.floor(math.sqrt(20)))    -- 4
print(math.max(math.floor(3.9), 4)) -- 4
print(math.abs(math.min(-5, -10)))  -- 5


-- ============================================
-- A HEALTH BAR EXAMPLE
-- ============================================

local health = 75
local maxHealth = 100

local percent = (health / maxHealth) * 100
local bars = math.floor(percent / 10)
local barText = string.rep("=", bars) .. string.rep("-", 10 - bars)

print("HP: [" .. barText .. "] " .. math.floor(percent) .. "%")
-- HP: [=======---] 75%


-- ============================================
-- A DISTANCE EXAMPLE
-- ============================================

-- The distance between two points (x1, z1) and (x2, z2).

local x1, z1 = 0, 0
local x2, z2 = 3, 4

local dx = x2 - x1
local dz = z2 - z1
local distance = math.sqrt(dx * dx + dz * dz)

print("Distance:", distance)     -- 5


-- ============================================
-- A CLAMP EXAMPLE
-- ============================================

-- Clamp means: keep a value within a range.

local function clamp(value, minValue, maxValue)
    return math.max(minValue, math.min(value, maxValue))
end

print(clamp(5, 0, 10))      -- 5
print(clamp(-3, 0, 10))     -- 0
print(clamp(15, 0, 10))     -- 10

-- Very useful for health, stamina, and positions.


-- ============================================
-- A ROUNDING FUNCTION
-- ============================================

-- Lua does not have a built-in round-to-decimal function.

local function round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

print(round(3.14159, 2))    -- 3.14
print(round(3.14159, 3))    -- 3.142
print(round(3.7))           -- 4
print(round(3.2))           -- 3


-- ============================================
-- A LEVEL UP EXAMPLE
-- ============================================

local xp = 250
local xpPerLevel = 100

local level = math.floor(xp / xpPerLevel)
local remainder = xp % xpPerLevel

print("Level:", level)                    -- 2
print("XP into level:", remainder)        -- 50
print("XP to next level:", xpPerLevel - remainder)   -- 50


-- ============================================
-- AN ENEMY SPAWN EXAMPLE
-- ============================================

-- Spawn enemies in a grid pattern.
-- Snap positions to every 10 studs.

local function snapToGrid(value, gridSize)
    return math.floor(value / gridSize + 0.5) * gridSize
end

print(snapToGrid(23, 10))      -- 20
print(snapToGrid(27, 10))      -- 30
print(snapToGrid(15, 10))      -- 20


-- ============================================
-- COMMON MISTAKES
-- ============================================

-- Mistake 1: Forgetting math. prefix.

-- floor(3.7)            -- ERROR
-- math.floor(3.7)       -- OK

-- Mistake 2: Passing a string.

-- math.floor("3.7")     -- ERROR
-- math.floor(3.7)       -- OK

-- Mistake 3: Expecting math.floor to round.

-- math.floor(3.9)       -- 3, not 4
-- Use the round function above instead.

-- Mistake 4: Forgetting to check for division by zero.

local n = 0
if n ~= 0 then
    print(10 / n)
end

-- Mistake 5: Using math.pow instead of ^.

-- Both work, but ^ is shorter and standard in Lua.


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - math.floor rounds down.
-- - math.ceil rounds up.
-- - math.abs removes the negative sign.
-- - math.max and math.min find the largest or smallest.
-- - math.sqrt gives the square root.
-- - math.huge is infinity.
-- - math.pi is 3.1415926535898.
-- - You can combine functions.
-- - Clamp keeps values in range.
-- - Round to decimals is a common custom function.
```
