# 03 - Strings

In this lesson you will learn how to work with text in Lua.

You will learn:

- What a string is
- How to join strings together
- How to find the length of a string
- How to change text to uppercase or lowercase
- How to grab part of a string
- How to format strings with `string.format`
- How to replace text inside a string

Strings are everywhere in Roblox.
Player names, chat messages, UI labels, item descriptions, all strings.

---

## What Is a String

A string is text.

```lua
local name = "Alex"
local city = "Accra"
local message = "Welcome to the game"
```

Strings always go in double quotes.

You can also use single quotes:

```lua
local name = 'Alex'
```

But double quotes are the standard in Roblox.
Use double quotes unless you have a reason not to.

---

## Joining Strings

You can join two strings with the `..` operator.

```lua
local first = "Alex"
local last = "Johnson"

local full = first .. " " .. last
print(full)     -- Alex Johnson
```

The `..` operator glues strings together.
Notice the `" "` in the middle. That is a space.
Without it, you would get `AlexJohnson`.

You can join as many as you want:

```lua
local greeting = "Hello, " .. first .. " " .. last .. "!"
print(greeting)   -- Hello, Alex Johnson!
```

---

## String Length

The `#` operator gives the length of a string.

```lua
local name = "Alex"
print(#name)      -- 4

local empty = ""
print(#empty)     -- 0
```

This counts every character, including spaces.

```lua
local sentence = "Hello World"
print(#sentence)   -- 11
```

---

## Uppercase and Lowercase

Strings have built in functions you call with a colon.

```lua
local name = "Alex"

print(name:upper())    -- ALEX
print(name:lower())    -- alex
```

The `:upper()` function returns a new string in uppercase.
The `:lower()` function returns a new string in lowercase.

These do not change the original string.
They return a new one.

```lua
local name = "Alex"
local upperName = name:upper()

print(name)        -- Alex
print(upperName)   -- ALEX
```

---

## Grabbing Part of a String

The `:sub()` function grabs part of a string.

```lua
local word = "Hello"

print(word:sub(1, 3))    -- Hel
print(word:sub(2, 4))    -- ell
print(word:sub(1, 1))    -- H
print(word:sub(5, 5))    -- o
```

The first number is where to start.
The second number is where to stop.

Both are included.

Index 1 is the first character.
Lua strings start at 1, not 0.

```lua
local word = "Roblox"

print(word:sub(1, 3))   -- Rob
print(word:sub(4, 6))   -- lox
```

---

## Finding Text Inside a String

The `:find()` function looks for text and tells you where it starts.

```lua
local sentence = "The cat sat on the mat"

print(sentence:find("cat"))    -- 5
print(sentence:find("mat"))    -- 20
print(sentence:find("dog"))    -- nil
```

If the text is not found, `find` returns `nil`.

You can use this in an `if` statement:

```lua
if sentence:find("cat") then
    print("The sentence mentions a cat")
end
```

---

## Replacing Text

The `:gsub()` function replaces text.

```lua
local sentence = "I like cats"

local new = sentence:gsub("cats", "dogs")
print(new)   -- I like dogs
```

The letters `gsub` stand for "global substitute".
It replaces every match, not just the first one.

```lua
local text = "red red red"
print(text:gsub("red", "blue"))   -- blue blue blue
```

---

## string.format

`string.format` builds a string from a template.

```lua
local name = "Alex"
local age = 25

local message = string.format("My name is %s and I am %d years old", name, age)
print(message)   -- My name is Alex and I am 25 years old
```

The `%s` means "put a string here".
The `%d` means "put a number here".

Common placeholders:

| Placeholder | Means |
|-------------|-------|
| %s | string |
| %d | integer number |
| %f | decimal number |
| %x | hexadecimal |

Example with `%f`:

```lua
local price = 9.99
print(string.format("Price: $%.2f", price))   -- Price: $9.99
```

The `.2` tells it to show two decimal places.

---

## Escaping Quotes

If you need a quote inside a string, use a backslash.

```lua
print("She said \"hello\" to me")
```

Output:

```text
She said "hello" to me
```

Other useful escapes:

| Escape | Means |
|--------|-------|
| \" | double quote |
| \n | new line |
| \t | tab |
| \\ | backslash |

Example with a new line:

```lua
print("Line 1\nLine 2")
```

Output:

```text
Line 1
Line 2
```

---

## Combining Everything

Here is a small example using everything in this lesson.

```lua
local name = "Alex"
local city = "Accra"

-- Uppercase for a title
print("=== " .. name:upper() .. " ===")

-- Format with placeholders
print(string.format("%s lives in %s", name, city))

-- Length
print("Name length:", #name)

-- Replace
local newName = name:gsub("A", "@")
print("After replace:", newName)
```

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
local firstName = "Alex"
local lastName = "Johnson"

local fullName = firstName .. " " .. lastName
print("Full name:", fullName)
print("Uppercase:", fullName:upper())
print("Length:", #fullName)

local intro = string.format("Hello, my name is %s", fullName)
print(intro)
```

Press F5.
Check the Output window.

Now change the names.
Run it again.
See how the output changes.

---

## Common Mistakes

Mistake: Forgetting the space when joining strings.

Result: `AlexJohnson` instead of `Alex Johnson`.
Fix: Add `" "` between them.

Mistake: Using `+` to join strings.

Result: Lua errors. The `+` is for numbers only.
Fix: Use `..` to join strings.

Mistake: Forgetting the colon before string functions.

Result: Error. Functions must be called on the string.
Fix: `name:upper()` not `name.upper()`.

Mistake: Using 0 as the first index.

Result: `word:sub(0, 3)` gives unexpected results.
Fix: Lua strings start at 1.

Mistake: Forgetting `%s` or `%d` in `string.format`.

Result: Extra arguments are ignored.
Fix: Match the placeholders to the arguments.

Mistake: Forgetting to escape quotes.

Result: Syntax error.
Fix: Use `\"` inside a string.

---

## Summary

- Strings hold text
- Use `..` to join strings
- Use `#` to get the length
- Use `:upper()` and `:lower()` to change case
- Use `:sub()` to grab parts of a string
- Use `:find()` to search for text
- Use `:gsub()` to replace text
- Use `string.format` to build formatted strings
- Use `\"` to put a quote inside a string
- Lua strings start at index 1

You will use strings in every lesson from now on.
Player names, UI text, chat, all strings.

---

## Files in This Lesson

- [code/concat.lua](code/concat.lua) - joining strings
- [code/format.lua](code/format.lua) - string.format examples
- [code/methods.lua](code/methods.lua) - built in string functions
- [challenge.md](challenge.md) - your exercise

---

Next: [code/concat.lua](code/concat.lua)
