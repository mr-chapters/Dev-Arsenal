-- methods.lua
-- Lesson 03 - Strings
-- Built in string functions in Lua.
--
-- These are functions you call on a string with a colon.
-- They return a new value. They do not change the original.
--
-- This is a reference file. Copy the code into a Script inside Roblox Studio.
-- Put the Script in ServerScriptService, then press F5 to play.


-- ============================================
-- LENGTH
-- ============================================

-- Use the # operator to get the length of a string.

local name = "Alex"
print(#name)      -- 4

local sentence = "Hello World"
print(#sentence)  -- 11

local empty = ""
print(#empty)     -- 0


-- ============================================
-- UPPERCASE AND LOWERCASE
-- ============================================

-- :upper() returns the string in uppercase.
-- :lower() returns the string in lowercase.

local word = "Hello"

print(word:upper())    -- HELLO
print(word:lower())    -- hello

-- The original string is not changed.

print(word)            -- Hello


-- ============================================
-- SUBSTRINGS
-- ============================================

-- :sub(start, stop) returns part of the string.
-- Index 1 is the first character.

local text = "Roblox"

print(text:sub(1, 3))   -- Rob
print(text:sub(4, 6))   -- lox
print(text:sub(1, 1))   -- R
print(text:sub(6, 6))   -- x

-- If you leave off the stop, it goes to the end.

print(text:sub(3))      -- blox


-- ============================================
-- FIND
-- ============================================

-- :find(text) returns the position where text starts.
-- Returns nil if not found.

local sentence = "The cat sat on the mat"

print(sentence:find("cat"))     -- 5
print(sentence:find("mat"))     -- 20
print(sentence:find("dog"))     -- nil

-- Use it in an if statement.

if sentence:find("cat") then
    print("Sentence contains cat")
end


-- ============================================
-- REPLACE
-- ============================================

-- :gsub(find, replace) replaces all matches.

local text = "I like cats and cats like me"
print(text:gsub("cats", "dogs"))
-- I like dogs and dogs like me

-- Replace single characters.

local word = "hello"
print(word:gsub("l", "L"))
-- heLLo


-- ============================================
-- TRIM WHITESPACE
-- ============================================

-- Lua does not have a built in trim.
-- But you can write one.

local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

local messy = "   hello   "
print("[" .. trim(messy) .. "]")   -- [hello]


-- ============================================
-- REPEAT
-- ============================================

-- :rep(n) repeats the string n times.

print("ab":rep(3))      -- ababab
print("-":rep(20))      -- --------------------

-- Useful for drawing lines in the Output window.

print("=" :rep(30))


-- ============================================
-- REVERSE
-- ============================================

-- string.reverse returns the string backwards.

print(string.reverse("hello"))    -- olleh
print(string.reverse("Roblox"))   -- xolboR


-- ============================================
-- BYTE AND CHAR
-- ============================================

-- string.byte returns the numeric code of a character.
-- string.char returns the character for a numeric code.

print(string.byte("A"))     -- 65
print(string.char(65))      -- A
print(string.char(66))      -- B


-- ============================================
-- SPLIT
-- ============================================

-- Lua does not have a built in split.
-- But you can write one.

local function split(text, sep)
    local parts = {}
    for piece in text:gmatch("([^" .. sep .. "]+)") do
        table.insert(parts, piece)
    end
    return parts
end

local csv = "apple,banana,cherry"
local fruits = split(csv, ",")

for i, fruit in ipairs(fruits) do
    print(i, fruit)
end
-- 1  apple
-- 2  banana
-- 3  cherry


-- ============================================
-- STARTS WITH AND ENDS WITH
-- ============================================

-- Lua does not have these built in, but you can write them.

local function startsWith(text, prefix)
    return text:sub(1, #prefix) == prefix
end

local function endsWith(text, suffix)
    return text:sub(-#suffix) == suffix
end

local filename = "photo.png"

print(startsWith(filename, "photo"))    -- true
print(endsWith(filename, ".png"))       -- true
print(endsWith(filename, ".jpg"))       -- false


-- ============================================
-- A SMALL EXAMPLE
-- ============================================

local rawInput = "  ROBLOX  "

-- Trim it
local trimmed = rawInput:match("^%s*(.-)%s*$")
print("[" .. trimmed .. "]")   -- [ROBLOX]

-- Lowercase it
local lower = trimmed:lower()
print(lower)                   -- roblox

-- Capitalize the first letter
local capitalized = lower:sub(1, 1):upper() .. lower:sub(2)
print(capitalized)             -- Roblox

-- Length
print(#capitalized)            -- 6


-- ============================================
-- COMMON MISTAKES
-- ============================================

-- Mistake 1: Using a dot instead of a colon.

-- print("hello".upper())     -- ERROR
-- print("hello":upper())     -- OK

-- Mistake 2: Thinking the string changed.

local word = "hello"
word:upper()
print(word)                    -- hello, not HELLO

-- You have to store the result:

local upper = word:upper()
print(upper)                   -- HELLO

-- Mistake 3: Using 0 as the first index.

-- print("hello":sub(0, 2))   -- unexpected
-- print("hello":sub(1, 2))   -- OK

-- Mistake 4: Forgetting that find returns nil, not false.

local text = "abc"
if text:find("x") == nil then
    print("Not found")
end


-- ============================================
-- WHAT YOU LEARNED
-- ============================================

-- - #text gets the length.
-- - :upper() and :lower() change case.
-- - :sub(start, stop) grabs part of a string.
-- - :find(text) searches for text.
-- - :gsub(find, replace) replaces text.
-- - :rep(n) repeats the string.
-- - string.reverse flips the string.
-- - You can write your own trim and split helpers.
-- - Strings are immutable. Always store the returned value.
