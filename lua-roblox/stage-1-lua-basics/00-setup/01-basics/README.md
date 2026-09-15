# 01 - Basics

Welcome to your first real lesson.

In this lesson you will write your first Lua code inside Roblox Studio.

You will learn:

- What Lua is
- How to print text to the Output window
- How to write comments
- How to run a script

This lesson is short. Do not rush it.
The goal is to make sure everything works before moving on.

---

## What Is Lua

Lua is a programming language.

Roblox uses Lua to control everything in a game.
Every moving part, every button, every enemy, every scoreboard, all written in Lua.

When you write Lua, you are giving instructions to Roblox.
Roblox reads them and makes them happen.

A Lua script is just a list of instructions.

---

## Your First Instruction

The simplest instruction in Lua is `print`.

`print` shows text on the screen.
In Roblox, the text appears in the Output window.

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
print("Hello, Roblox!")
```

Press F5 to play.

Open the Output window if you do not see it. Press F9.

You should see:

```text
Hello, Roblox!
```

That is your first program.

---

## What Just Happened

1. You told Roblox to run a script
2. Roblox read the line `print("Hello, Roblox!")`
3. Roblox sent the text to the Output window
4. You saw it appear

That is the whole loop.
Every script you write follows this same pattern.
You write instructions. Roblox runs them.

---

## Printing Numbers

`print` is not just for text.

You can print numbers:

```lua
print(42)
print(3.14)
print(100 + 25)
```

The Output window will show:

```text
42
3.14
125
```

Notice that Lua did the math inside `print`.
You can put any expression inside the parentheses.

---

## Printing Multiple Things

You can print more than one thing at once.

Separate them with commas:

```lua
print("My age is", 25)
print("The answer is", 40 + 2)
```

The Output window shows:

```text
My age is 25
The answer is 42
```

Lua puts a space between each item.

---

## Comments

Comments are notes in your code.

Lua ignores them. They are only for humans.

You write a single line comment with two dashes:

```lua
-- This is a comment
print("Hello")
```

The `--` tells Lua to ignore everything after it on that line.

You can also write multi line comments:

```lua
--[[
   This is a
   multi line
   comment
]]
```

Use comments to explain what your code does.
Future you will thank past you.

---

## Why Comments Matter

Code is read far more often than it is written.

A comment like this:

```lua
-- Set the player's starting health to 100
player.health = 100
```

is far easier to understand than this:

```lua
player.health = 100
```

Write comments for anything that is not obvious.

Do not comment every line.
Comment the parts that need explaining.

---

## Your First Script

Here is a complete script you can run right now.

Open Roblox Studio.
Insert a Script into ServerScriptService.
Delete everything in it.
Paste this:

```lua
-- My first Roblox script

print("Hello, Roblox!")
print("My name is Alex")
print("I am learning Lua")
print("2 + 2 equals", 2 + 2)
```

Press F5 to play.

Look at the Output window.

You should see:

```text
Hello, Roblox!
My name is Alex
I am learning Lua
2 + 2 equals 4
```

Try changing the text.
Try changing the numbers.
Run it again.
See what changes.

---

## The Order of Instructions

Lua runs your code from top to bottom.

This script:

```lua
print("First")
print("Second")
print("Third")
```

always prints:

```text
First
Second
Third
```

The order matters.
If you want something to happen first, write it first.

---

## Common Mistakes

Mistake: Writing `Print` with a capital P.

Result: Lua errors. It is case sensitive.
Always write `print` in lowercase.

Mistake: Forgetting the quotes around text.

Result: Lua tries to read the text as a variable and errors.
Text always goes in `"double quotes"`.

Mistake: Forgetting the parentheses.

Result: Lua does not know what to do.
Every function call needs `()`.

Mistake: Putting the script in the wrong place.

Result: It does not run.
For this lesson, always put Scripts in ServerScriptService.

Mistake: Running the script but not seeing output.

Result: The Output window is probably closed.
Press F9 to open it.

---

## Practice

Do these steps to lock in what you learned.

1. Open Roblox Studio
2. Insert a Script into ServerScriptService
3. Write `print("Hello, Roblox!")`
4. Press F5
5. Check the Output window
6. Change the text
7. Run it again
8. Print your own name
9. Print your age
10. Print the result of `10 * 5`
11. Add a comment above each print line
12. Break something on purpose. Remove a quote. Run it. Read the error.

Doing step 12 is the most important part.
Breaking things is how you learn what errors mean.

---

## Checklist

- [ ] I inserted a Script into ServerScriptService
- [ ] I ran `print("Hello, Roblox!")`
- [ ] I saw the text in the Output window
- [ ] I printed a number
- [ ] I printed multiple things with commas
- [ ] I wrote a comment
- [ ] I wrote a multi line comment
- [ ] I broke something on purpose and read the error
- [ ] I understand the code runs top to bottom

When all boxes are checked, open the challenge file.

---

## Extra Notes

The Output window is your best friend.

Open it often.
Read what it says.
When something goes wrong, the answer is almost always there.

You will use `print` in every lesson from now on.
It is the fastest way to understand what your code is doing.

When you are confused, print the variable.
When something is not working, print what you think the value should be.
See what the real value is.
Fix the difference.

---

## Files in This Lesson

- [code/hello.lua](code/hello.lua) - the hello world script
- [code/comments.lua](code/comments.lua) - examples of comments
- [challenge.md](challenge.md) - your exercise

---

Next: [code/hello.lua](code/hello.lua)
