-- constants.lua
-- Lesson 02 - Variables
-- How to write constants in Lua.
--
-- A constant is a value that should never change.
-- Lua does not enforce this, but by convention we write
-- constant names in ALL CAPS so anyone reading the code
-- knows not to change them.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- CONSTANTS
-- ============================================

-- Maximum health any player can have.
local MAX_HEALTH = 100

-- How much damage a player takes per hit.
local HIT_DAMAGE = 10

-- How much money every new player starts with.
local STARTING_COINS = 0

-- How high a player can jump (in studs).
local JUMP_HEIGHT = 7

-- Gravity force used in physics calculations.
local GRAVITY = 196.2

-- How long a round lasts, in seconds.
local ROUND_DURATION = 300

-- How many players can be in one server.
local MAX_PLAYERS = 12


-- ============================================
-- USING THE CONSTANTS
-- ============================================

print("Max health:", MAX_HEALTH)
print("Hit damage:", HIT_DAMAGE)
print("Starting coins:", STARTING_COINS)
print("Jump height:", JUMP_HEIGHT)
print("Gravity:", GRAVITY)
print("Round duration:", ROUND_DURATION, "seconds")
print("Max players:", MAX_PLAYERS)


-- ============================================
-- WHY CONSTANTS ARE USEFUL
-- ============================================

-- Imagine you use the number 100 in 20 different places in your game.
-- Later you want to change it to 150.
-- Without a constant, you have to find and change all 20 places.
-- It is easy to miss one.
--
-- With a constant, you change one line.

local health = MAX_HEALTH
print("Player health starts at", health)

-- If you want to change starting health to 150,
-- you only change the MAX_HEALTH line at the top.
-- Everything else follows automatically.


-- ============================================
-- CONSTANTS WITH CALCULATIONS
-- ============================================

-- You can build constants from other constants.

local MAX_ARMOR = MAX_HEALTH * 2
local HITS_TO_DIE = MAX_HEALTH / HIT_DAMAGE
local ROUND_MINUTES = ROUND_DURATION / 60

print("Max armor:", MAX_ARMOR)
print("Hits to die:", HITS_TO_DIE)
print("Round duration in minutes:", ROUND_MINUTES)


-- ============================================
-- STRING CONSTANTS
-- ============================================

-- Constants are not just numbers.
-- Strings can be constants too.

local GAME_NAME = "Code Forge Practice"
local WELCOME_MESSAGE = "Welcome to the game!"
local VERSION = "1.0.0"

print(GAME_NAME)
print(WELCOME_MESSAGE)
print("Version:", VERSION)


-- ============================================
-- A SMALL EXAMPLE
-- ============================================

-- A simple starting coin check.

local coins = STARTING_COINS

print("Your coins:", coins)

if coins < 100 then
    print("You are broke. Go earn some coins.")
end

-- Notice the number 100 here is written directly.
-- If this value matters, make it a constant too.

local LOW_COIN_THRESHOLD = 100

if coins < LOW_COIN_THRESHOLD then
    print("You are broke. Go earn some coins.")
end

-- Now if you want to change what "broke" means,
-- you change one line at the top.


-- ============================================
-- RULES FOR CONSTANTS
-- ============================================

-- 1. Write the name in ALL CAPS.
-- 2. Use underscores between words.
-- 3. Put them at the top of your script.
-- 4. Never change their value later in the script.
-- 5. Give them a comment explaining what they are.


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - Constants are values that should not change.
-- - Write their names in ALL CAPS.
-- - Put them at the top of the script.
-- - Use them for any value that appears in many places.
-- - It makes your code easier to change and easier to read.
