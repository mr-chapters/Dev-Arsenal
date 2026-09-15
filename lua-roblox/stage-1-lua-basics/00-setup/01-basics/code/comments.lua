-- comments.lua
-- Lesson 01 - Basics
-- Examples of comments in Lua.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- This is a single line comment.
-- Lua ignores everything after the two dashes on this line.
print("This line runs")


-- Comments are for humans, not for Lua.
-- Use them to explain what your code does.
-- Use them to leave notes for yourself.
-- Use them to temporarily disable a line of code.


-- You can put a comment at the end of a line of code.
print("This also runs")  -- this part is ignored


-- Here is a line of code that is disabled with a comment.
-- print("This line does not run")


-- Multi line comments start with --[[ and end with ]]
-- Everything between them is ignored by Lua.

--[[
   This is a multi line comment.
   Lua ignores everything inside it.
   You can write as many lines as you want.
   This is useful for long explanations.
]]


-- Multi line comments are also useful for temporarily
-- disabling a block of code.

--[[
print("This line is disabled")
print("This line is also disabled")
print("And this one too")
]]


-- You can also add a little decoration to your comments
-- to make important sections stand out.

-- ============================================
-- SECTION: Player Setup
-- ============================================

print("Setting up player")


-- ============================================
-- SECTION: Game Loop
-- ============================================

print("Starting game loop")


-- Good comment examples:

-- Bad comment example:
-- print("hi")

-- Good comment example:
-- Print a greeting to the Output window so we can confirm the script runs.
print("hi")


-- Another good example:

-- player.health starts at 100 and drops by 10 each hit.
-- This loop runs until health reaches zero.
local health = 100

-- We will use real variables in Lesson 02.
-- For now, this is just a placeholder comment showing the idea.


-- Comments do not slow down your script.
-- Use them freely, but do not comment every line.
-- Comment the parts that are not obvious.
