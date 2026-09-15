-- format.lua
-- Lesson 03 - Strings
-- How to build formatted strings with string.format.
--
-- string.format takes a template and fills in values.
-- It is cleaner than using .. for long messages.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- THE BASIC PATTERN
-- ============================================

-- string.format("template", value1, value2, ...)

local name = "Alex"
local message = string.format("Hello, %s", name)
print(message)     -- Hello, Alex


-- ============================================
-- THE PLACEHOLDERS
-- ============================================

-- %s  -> string
-- %d  -> integer number
-- %f  -> decimal number
-- %x  -> hexadecimal

local playerName = "Alex"
local playerLevel = 5
local playerHealth = 87.5

print(string.format("Name: %s", playerName))
print(string.format("Level: %d", playerLevel))
print(string.format("Health: %f", playerHealth))


-- ============================================
-- MULTIPLE VALUES
-- ============================================

-- You can put as many placeholders as you want.
-- The order matters. They match up left to right.

local name = "Alex"
local age = 25
local city = "Accra"

local intro = string.format("My name is %s. I am %d years old. I live in %s.", name, age, city)
print(intro)
-- My name is Alex. I am 25 years old. I live in Accra.


-- ============================================
-- FORMATTING DECIMALS
-- ============================================

-- By default, %f shows six decimal places.

local price = 9.99
print(string.format("Price: %f", price))      -- Price: 9.990000

-- You can tell it how many decimals to show.
-- %.2f means two decimal places.

print(string.format("Price: %.2f", price))    -- Price: 9.99
print(string.format("Price: %.0f", price))    -- Price: 10
print(string.format("Price: %.4f", price))    -- Price: 9.9900


-- ============================================
-- PADDING NUMBERS WITH ZEROS
-- ============================================

-- %02d means two digits with a leading zero.

local minutes = 5
local seconds = 7

print(string.format("Time: %02d:%02d", minutes, seconds))
-- Time: 05:07

local hours = 2
print(string.format("Clock: %02d:%02d:%02d", hours, minutes, seconds))
-- Clock: 02:05:07

-- This is perfect for timers and clocks in games.


-- ============================================
-- PADDING TEXT WITH SPACES
-- ============================================

-- %10s means at least ten characters wide, padded on the left.

print(string.format("[%10s]", "Alex"))
-- [      Alex]

-- %-10s means left aligned, padded on the right.

print(string.format("[%-10s]", "Alex"))
-- [Alex      ]

-- Useful for making aligned columns in the Output window.


-- ============================================
-- PERCENT SIGN
-- ============================================

-- To put a literal percent sign, use %%

local percent = 75
print(string.format("Progress: %d%%", percent))
-- Progress: 75%


-- ============================================
-- A PLAYER STATS EXAMPLE
-- ============================================

local playerName = "Alex"
local level = 5
local health = 87.5
local maxHealth = 100
local coins = 1250
local isAlive = true

print(string.format("=== %s ===", playerName))
print(string.format("Level:       %d", level))
print(string.format("Health:      %.1f / %d", health, maxHealth))
print(string.format("Coins:       %d", coins))
print(string.format("Alive:       %s", tostring(isAlive)))

-- tostring converts a value to a string.
-- Needed for booleans in some cases.


-- ============================================
-- A COMBAT LOG EXAMPLE
-- ============================================

local attacker = "Alex"
local defender = "Bob"
local damage = 25

print(string.format("%s hit %s for %d damage", attacker, defender, damage))
-- Alex hit Bob for 25 damage


-- ============================================
-- A SHOP EXAMPLE
-- ============================================

local itemName = "Health Potion"
local price = 12.5
local quantity = 3

print(string.format("Item:  %s", itemName))
print(string.format("Price: $%.2f", price))
print(string.format("Qty:   %d", quantity))
print(string.format("Total: $%.2f", price * quantity))


-- ============================================
-- COMPARING .. AND string.format
-- ============================================

-- With .. (works, but messy for long strings):

local name = "Alex"
local age = 25
local city = "Accra"
print(name .. " is " .. age .. " and lives in " .. city)

-- With string.format (cleaner):

print(string.format("%s is %d and lives in %s", name, age, city))

-- Both work. For simple cases, .. is fine.
-- For anything with numbers or alignment, string.format is better.


-- ============================================
-- A DIGITAL CLOCK
-- ============================================

-- A simple clock that shows hours, minutes, seconds.

local hours = 9
local minutes = 4
local seconds = 3

print(string.format("%02d:%02d:%02d", hours, minutes, seconds))
-- 09:04:03


-- ============================================
-- A HEALTH BAR AS TEXT
-- ============================================

local health = 75
local maxHealth = 100
local percent = (health / maxHealth) * 100

print(string.format("HP: %d / %d (%.0f%%)", health, maxHealth, percent))
-- HP: 75 / 100 (75%)


-- ============================================
-- COMMON MISTAKES
-- ============================================

-- Mistake 1: Wrong number of arguments

-- string.format("Hello %s and %s", "Alex")   -- ERROR
-- string.format("Hello %s and %s", "Alex", "Bob")   -- OK

-- Mistake 2: Wrong placeholder type

-- string.format("Number: %d", "Alex")   -- ERROR
-- string.format("Number: %d", 42)       -- OK

-- Mistake 3: Forgetting string.format

-- "Hello %s"              -- just a string with %s in it
-- string.format("Hello %s", "Alex")   -- Hello Alex

-- Mistake 4: Trying to use %s with a table

-- string.format("Value: %s", {1, 2, 3})   -- ERROR
-- Convert to string first with tostring or a loop.


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - string.format builds strings from templates.
-- - %s inserts a string.
-- - %d inserts an integer.
-- - %f inserts a decimal.
-- - %.2f controls decimal places.
-- - %02d pads with zeros.
-- - %% is a literal percent sign.
-- - Use string.format for clean, aligned output.
