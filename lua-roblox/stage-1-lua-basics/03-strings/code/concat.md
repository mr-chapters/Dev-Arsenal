-- concat.lua
-- Lesson 03 - Strings
-- How to join strings together in Lua.
--
-- The .. operator joins two strings.
-- This is called concatenation.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- BASIC CONCATENATION
-- ============================================

local first = "Alex"
local last = "Johnson"

-- Join two strings with ..
local fullName = first .. last
print(fullName)     -- AlexJohnson

-- Notice there is no space.
-- The .. operator does not add anything. It just glues.


-- ============================================
-- ADDING A SPACE
-- ============================================

-- Add a space by joining a " " in the middle.

local fullName2 = first .. " " .. last
print(fullName2)    -- Alex Johnson


-- ============================================
-- JOINING MULTIPLE STRINGS
-- ============================================

-- You can join as many strings as you want in one line.

local greeting = "Hello, " .. first .. " " .. last .. "!"
print(greeting)     -- Hello, Alex Johnson!


-- ============================================
-- JOINING STRINGS WITH NUMBERS
-- ============================================

-- If you join a number to a string, Lua converts the number to text.

local name = "Alex"
local age = 25

local message = name .. " is " .. age .. " years old"
print(message)      -- Alex is 25 years old

-- This is very common in games.
-- Score displays, health bars, timers, all use this pattern.


-- ============================================
-- JOINING WITH VARIABLES AND LITERALS
-- ============================================

-- You can mix variables and raw text.

local score = 150
local level = 3

print("Score: " .. score)                     -- Score: 150
print("Level: " .. level)                     -- Level: 3
print("Score: " .. score .. " Level: " .. level)


-- ============================================
-- BUILDING A SENTENCE PIECE BY PIECE
-- ============================================

-- You can build a long string over several lines
-- by reassigning the variable.

local intro = "My name is "
intro = intro .. "Alex"
intro = intro .. " and I live in "
intro = intro .. "Accra"
intro = intro .. "."

print(intro)   -- My name is Alex and I live in Accra.

-- This works, but the string.format approach in format.lua
-- is usually cleaner for longer messages.


-- ============================================
-- JOINING AN EMPTY STRING
-- ============================================

-- Joining an empty string does nothing.
-- It is useful when you build strings in loops.

local empty = ""
local text = "Hello"
print(empty .. text)   -- Hello


-- ============================================
-- A SMALL EXAMPLE
-- ============================================

-- A welcome message for a player.

local playerName = "Alex"
local playerLevel = 5

local welcome = "Welcome, " .. playerName .. "!"
local levelMessage = "You are level " .. playerLevel .. "."
local full = welcome .. " " .. levelMessage

print(full)
-- Welcome, Alex! You are level 5.


-- ============================================
-- WHY CONCATENATION MATTERS
-- ============================================

-- Every UI label in Roblox that shows a value
-- is built with concatenation.
--
-- Example:
-- "Coins: 150"
-- "Health: 75 / 100"
-- "Level 5 - Alex"
--
-- You will use .. constantly in every game you build.


-- ============================================
-- COMMON MISTAKES
-- ============================================

-- Mistake 1: Using + instead of ..

-- local a = "Hello" + "World"    -- ERROR
-- local b = "Hello" .. "World"   -- OK

-- Mistake 2: Forgetting the space

local noSpace = "Hello" .. "World"
print(noSpace)     -- HelloWorld

local withSpace = "Hello" .. " " .. "World"
print(withSpace)   -- Hello World

-- Mistake 3: Forgetting a dot
-- .. is two dots. Using a single dot is an error.

-- local wrong = "Hello" . "World"   -- ERROR


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - The .. operator joins strings.
-- - Join as many strings as you want.
-- - You can join numbers to strings.
-- - Use " " to add spaces.
-- - Concatenation is used everywhere in Roblox.
