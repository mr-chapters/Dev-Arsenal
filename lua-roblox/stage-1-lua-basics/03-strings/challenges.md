# Challenge 03 - Strings

This is your exercise for Lesson 03.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that takes a player name and builds several formatted messages using strings.

The script must:

- Store a first name and last name in variables
- Join them into a full name
- Print the full name in uppercase
- Print the length of the full name
- Print a welcome message using `string.format`
- Print a stats line using `%d` and `%s`
- Include at least one `:gsub` example

---

## Step by Step

1. Open Roblox Studio
2. In the Explorer, click ServerScriptService
3. Right-click it and choose Insert Object, then Script
4. Delete the default code inside the script
5. Write your own code
6. Press F5 to play
7. Check the Output window (press F9)
8. Fix any errors you see
9. Save your work

---

## Expected Output

When your script runs, the Output window should show something like:

```text
=== Player Card ===
Full name: Alex Johnson
Uppercase: ALEX JOHNSON
Name length: 12

Welcome, Alex Johnson!
Level: 5
Coins: 150

Original: Alex Johnson
Replaced: @lex Johnson
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- A `firstName` variable and a `lastName` variable
- A `fullName` variable built with `..`
- A print using `:upper()`
- A print using `#` to show the length
- A print using `string.format` with `%s`
- A print using `string.format` with `%d`
- A print using `:gsub` to replace at least one character

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Add a `city` variable and print a sentence using `string.format`.

Example:

```lua
print(string.format("%s lives in %s", fullName, city))
```

### Bonus 2

Print a decorative line made with `:rep`.

Example:

```lua
print("-":rep(30))
```

### Bonus 3

Use `:sub` to print only the first three letters of the first name.

### Bonus 4

Build a digital clock using `%02d` placeholders.

Example:

```lua
print(string.format("%02d:%02d:%02d", hours, minutes, seconds))
```

### Bonus 5

Use `:find` to check if the full name contains the letter "a".
Print "Found" or "Not found".

### Bonus 6

Create a function that capitalizes the first letter of any string.

Example:

```lua
local function capitalize(text)
    return text:sub(1, 1):upper() .. text:sub(2):lower()
end

print(capitalize("alex"))   -- Alex
```

---

## Hints

Hint for joining strings:

```lua
local full = first .. " " .. last
```

Hint for uppercase:

```lua
print(full:upper())
```

Hint for length:

```lua
print(#full)
```

Hint for string.format:

```lua
print(string.format("Hello, %s", name))
```

Hint for a number in format:

```lua
print(string.format("Level: %d", level))
```

Hint for gsub:

```lua
print(full:gsub("A", "@"))
```

Hint for repeat:

```lua
print("=":rep(20))
```

Hint for substring:

```lua
print(first:sub(1, 3))
```

---

## Common Mistakes to Avoid

- Using `+` to join strings instead of `..`
- Forgetting the space between first and last name
- Forgetting the colon before `upper` or `gsub`
- Using `%d` for a string value
- Using `%s` for a number value in a way that breaks the format
- Forgetting to store the result of `:gsub` or `:upper`
- Forgetting to press F5 to run the script

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Building strings with `..`
- Using `string.format` with `%s` and `%d`
- Using `:upper`, `:lower`, `:sub`, `:gsub`, `:find`
- Using `#` for length
- Using `:rep` for decoration

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I created firstName, lastName, and fullName
- [ ] I printed the uppercase version
- [ ] I printed the length
- [ ] I used string.format with %s and %d
- [ ] I used :gsub to replace at least one character
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [04 - Math](../04-math/README.md).

---

Next: [04 - Math](../04-math/README.md)
