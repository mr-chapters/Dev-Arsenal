-- variables.lua
-- Lesson 02 - Variables
-- Basic variable examples.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- CREATING A VARIABLE
-- ============================================

-- Use the local keyword to create a variable.
-- The pattern is: local name = value

local name = "Alex"
local age = 25
local city = "Accra"

print(name)
print(age)
print(city)


-- ============================================
-- PRINTING A VARIABLE WITH A LABEL
-- ============================================

-- When you print, you can add a label so the output is easier to read.

print("Name:", name)
print("Age:", age)
print("City:", city)


-- ============================================
-- CHANGING A VARIABLE
-- ============================================

-- You can change a variable any time.
-- Do not write local again. Just assign a new value.

local score = 0
print("Starting score:", score)

score = 10
print("After change:", score)

score = score + 5
print("After adding 5:", score)


-- ============================================
-- COMBINING VARIABLES
-- ============================================

-- You can build new values from old ones.

local first = "Alex"
local last = "Johnson"

local fullName = first .. " " .. last
print("Full name:", fullName)


-- ============================================
-- NUMBERS IN VARIABLES
-- ============================================

local price = 9.99
local quantity = 3
local total = price * quantity

print("Price:", price)
print("Quantity:", quantity)
print("Total:", total)


-- ============================================
-- BOOLEANS IN VARIABLES
-- ============================================

local isAlive = true
local hasKey = false

print("Alive:", isAlive)
print("Has key:", hasKey)

-- Change one and run again.

-- isAlive = false
-- print("Alive:", isAlive)


-- ============================================
-- A SMALL PLAYER PROFILE
-- ============================================

local playerName = "Alex"
local playerAge = 25
local playerCity = "Accra"
local playerScore = 0
local playerAlive = true

print("=== Player Profile ===")
print("Name:", playerName)
print("Age:", playerAge)
print("City:", playerCity)
print("Score:", playerScore)
print("Alive:", playerAlive)


-- ============================================
-- UPDATING THE SCORE
-- ============================================

playerScore = playerScore + 100
print("Score after win:", playerScore)

playerScore = playerScore + 50
print("Score after bonus:", playerScore)

playerScore = playerScore - 30
print("Score after penalty:", playerScore)


-- ============================================
-- USING VARIABLES IN A SENTENCE
-- ============================================

print(playerName .. " is " .. playerAge .. " years old.")
print(playerName .. " lives in " .. playerCity .. ".")
print(playerName .. " has a score of " .. playerScore .. ".")


-- ============================================
-- GOOD NAMES VS BAD NAMES
-- ============================================

-- Good names describe what they hold.

local maxHealth = 100
local currentHealth = 75
local enemyCount = 5
local isDoorOpen = false

print("Max health:", maxHealth)
print("Current health:", currentHealth)
print("Enemies:", enemyCount)
print("Door open:", isDoorOpen)

-- Bad names like x, y, z are only okay for small math.

local x = 10
local y = 20
local z = x + y
print("Sum:", z)


-- ============================================
-- VARIABLES ARE TEMPORARY
-- ============================================

-- When the script ends, the values are gone.
-- Every time you press F5, the script starts fresh.

local counter = 0
print("Counter starts at:", counter)

counter = counter + 1
print("Counter now:", counter)

-- Run this again. It always starts at 0.
-- In Lesson 02 the values do not save between runs.
-- Saving player data comes in Stage 2.


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - Create a variable with: local name = value
-- - Change a value by assigning to it again without local
-- - Combine variables to build new ones
-- - Use descriptive names
-- - Variables reset every time the script runs
