
-- arithmetic.lua
-- Lesson 04 - Math
-- Basic arithmetic operators in Lua.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- THE SIX BASIC OPERATORS
-- ============================================

local a = 10
local b = 3

-- Addition
print("a + b =", a + b)     -- 13

-- Subtraction
print("a - b =", a - b)     -- 7

-- Multiplication
print("a * b =", a * b)     -- 30

-- Division
print("a / b =", a / b)     -- 3.3333333333333

-- Modulus (remainder)
print("a % b =", a % b)     -- 1

-- Power
print("a ^ b =", a ^ b)     -- 1000


-- ============================================
-- ORDER OF OPERATIONS
-- ============================================

-- Lua follows standard math rules.
-- Multiplication and division happen before addition and subtraction.
-- Parentheses always go first.

print(2 + 3 * 4)       -- 14
print((2 + 3) * 4)     -- 20
print(2 + 3 * 4 ^ 2)   -- 50

-- When in doubt, use parentheses.
-- They make the code clearer even when not strictly needed.


-- ============================================
-- INTEGER VS DECIMAL DIVISION
-- ============================================

-- Division always gives a decimal in Lua.

print(10 / 2)      -- 5.0
print(10 / 3)      -- 3.3333333333333
print(9 / 3)       -- 3.0

-- If you want a whole number, use math.floor.

print(math.floor(10 / 3))   -- 3


-- ============================================
-- MODULUS IN DETAIL
-- ============================================

-- Modulus gives the remainder after division.

print(10 % 3)      -- 1
print(15 % 5)      -- 0
print(7 % 2)       -- 1
print(20 % 7)      -- 6

-- Common use: check if a number is even or odd.

local n = 7

if n % 2 == 0 then
    print(n, "is even")
else
    print(n, "is odd")
end


-- ============================================
-- POWER IN DETAIL
-- ============================================

-- Power raises a number to an exponent.

print(2 ^ 3)       -- 8
print(5 ^ 2)       -- 25
print(10 ^ 0)      -- 1
print(9 ^ 0.5)     -- 3  (square root)


-- ============================================
-- COMBINING OPERATORS
-- ============================================

local health = 100
local damage = 25

health = health - damage
print("Health after hit:", health)      -- 75

local price = 20
local quantity = 3
local total = price * quantity
print("Total:", total)                  -- 60

local base = 10
local multiplier = 1.5
local boost = 5
local result = base * multiplier + boost
print("Result:", result)                -- 20


-- ============================================
-- A SMALL COMBAT EXAMPLE
-- ============================================

local baseDamage = 20
local attackMultiplier = 1.5
local defense = 5

local finalDamage = (baseDamage * attackMultiplier) - defense
print("Final damage:", finalDamage)     -- 25

local maxHealth = 100
local currentHealth = 75

currentHealth = currentHealth - finalDamage
print("Health after hit:", currentHealth)   -- 50


-- ============================================
-- CALCULATING A PERCENT
-- ============================================

local currentHealth = 75
local maxHealth = 100

local percent = (currentHealth / maxHealth) * 100
print("Health percent:", percent)       -- 75


-- ============================================
-- MULTIPLE OPERATIONS IN ONE LINE
-- ============================================

-- You can chain as many as you want.

local result = ((10 + 5) * 2) / 3 - 1
print("Result:", result)                -- 9

-- Break it down step by step:
-- 10 + 5 = 15
-- 15 * 2 = 30
-- 30 / 3 = 10
-- 10 - 1 = 9


-- ============================================
-- COMPOUND ASSIGNMENT
-- ============================================

-- Lua does not have += or -= like some languages.
-- You have to write it out.

local score = 0

score = score + 10
print("After +10:", score)      -- 10

score = score + 5
print("After +5:", score)       -- 15

score = score - 3
print("After -3:", score)       -- 12

score = score * 2
print("After *2:", score)       -- 24


-- ============================================
-- NEGATIVE NUMBERS
-- ============================================

local a = -10
local b = 5

print(a + b)     -- -5
print(a - b)     -- -15
print(a * b)     -- -50
print(a / b)     -- -2.0
print(-a)        -- 10 (negation)


-- ============================================
-- INTEGER OVERFLOW
-- ============================================

-- Lua handles very large numbers.
-- There is no fixed limit like in some languages.

print(2 ^ 50)              -- 1125899906842624
print(10 ^ 15)             -- 1000000000000000
print(2 ^ 100)             -- 1.2676506002282e+30

-- Very large numbers switch to scientific notation.
-- This is fine for most games.


-- ============================================
-- DIVISION BY ZERO
-- ============================================

-- Dividing by zero does not error in Lua.
-- It gives a special value.

local result = 10 / 0
print(result)     -- inf

-- inf means "infinity".
-- Avoid dividing by zero in your code.

local safe = 0
if safe ~= 0 then
    print(10 / safe)
else
    print("Cannot divide by zero")
end


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - +, -, *, /, %, ^ are the operators.
-- - Order of operations matches standard math.
-- - Use parentheses to control the order.
-- - Division always gives a decimal.
-- - % gives the remainder.
-- - ^ gives a power.
-- - Lua does not have += or -=.
-- - Dividing by zero gives inf, not an error.
