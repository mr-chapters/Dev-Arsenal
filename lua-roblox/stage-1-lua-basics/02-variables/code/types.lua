-- types.lua
-- Lesson 02 - Variables
-- The main data types in Lua.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- STRINGS
-- ============================================

-- A string is text.
-- Strings always go in double quotes.

local name = "Alex"
local city = "Accra"
local greeting = "Hello there"

print(name)
print(city)
print(greeting)

-- You can join two strings with the .. operator.

local first = "Alex"
local last = "Johnson"
local full = first .. " " .. last
print(full)     -- Alex Johnson

-- The length operator # gives the number of characters in a string.

print(#name)    -- 4

-- Strings have built in functions.
-- These are just a preview. There is more in Lesson 03.

print(name:upper())    -- ALEX
print(name:lower())    -- alex


-- ============================================
-- NUMBERS
-- ============================================

-- A number is any numeric value.
-- Numbers do not go in quotes.

local age = 25
local price = 9.99
local score = 0
local negative = -50

print(age)
print(price)
print(score)
print(negative)

-- You can do math with numbers.

local sum = 10 + 5
local difference = 10 - 5
local product = 10 * 5
local quotient = 10 / 5

print(sum)         -- 15
print(difference)  -- 5
print(product)     -- 50
print(quotient)    -- 2

-- Numbers in quotes are strings, not numbers.

local stringNumber = "25"
print(stringNumber + 5)   -- still works in Lua, but not recommended

-- Always keep numbers as numbers.


-- ============================================
-- BOOLEANS
-- ============================================

-- A boolean is either true or false.
-- No quotes.

local isAlive = true
local hasKey = false
local canJump = true

print(isAlive)
print(hasKey)
print(canJump)

-- Booleans are used for yes/no decisions.

local doorOpen = true

if doorOpen then
    print("You can walk through")
else
    print("The door is closed")
end

-- Change the value and run it again.
-- See how the output changes.


-- ============================================
-- NIL
-- ============================================

-- nil means "no value".
-- It is what a variable holds before you give it a value.

local mystery
print(mystery)     -- nil

mystery = "now it has a value"
print(mystery)     -- now it has a value

-- nil is often used to mean "not found" or "nothing here".


-- ============================================
-- TABLES
-- ============================================

-- A table is a container.
-- It can hold many values at once.
-- Tables use curly braces.

local fruits = {"apple", "banana", "cherry"}

print(fruits)          -- table: 0x...
print(fruits[1])       -- apple
print(fruits[2])       -- banana
print(fruits[3])       -- cherry

-- Tables are covered in full in Lesson 08.
-- This is just a preview so you know they exist.


-- ============================================
-- THE type FUNCTION
-- ============================================

-- Lua has a function called type.
-- It tells you what type a value is.

print(type("hello"))     -- string
print(type(42))          -- number
print(type(3.14))        -- number
print(type(true))        -- boolean
print(type(nil))         -- nil
print(type({}))          -- table
print(type(print))       -- function


-- ============================================
-- COMPARING TYPES
-- ============================================

-- A common mistake is comparing a string to a number.

local a = "25"
local b = 25

print(a == b)    -- false, one is a string, the other is a number

-- Always keep types consistent.

local correct = 25
local alsoCorrect = 25

print(correct == alsoCorrect)   -- true


-- ============================================
-- CHECKING TYPES
-- ============================================

-- You can check a value's type and act on it.

local value = "Alex"

if type(value) == "string" then
    print("It is text")
elseif type(value) == "number" then
    print("It is a number")
else
    print("It is something else")
end

-- Change the value above and run again.
-- See how the output changes.


-- ============================================
-- PUTTING IT TOGETHER
-- ============================================

local playerName = "Alex"       -- string
local playerAge = 25            -- number
local playerAlive = true        -- boolean
local playerScore = 0           -- number
local playerGuild = nil         -- nil, they are not in one yet

print("Player:", playerName)
print("Age:", playerAge)
print("Alive:", playerAlive)
print("Score:", playerScore)
print("Guild:", playerGuild)


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - Strings hold text, written in quotes.
-- - Numbers hold numeric values, no quotes.
-- - Booleans hold true or false.
-- - nil means no value.
-- - Tables hold many values at once.
-- - The type function tells you what type something is.
-- - Keep types consistent. Do not compare strings to numbers.
