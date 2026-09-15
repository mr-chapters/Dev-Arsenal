# 06 - Loops

In this lesson you will learn how to repeat code.

You will learn:

- What a loop is
- The for loop
- The while loop
- The repeat loop
- How to break out of a loop
- How to skip an iteration with continue

Loops are how you repeat things in a game.
Spawning enemies, updating UI, checking conditions, all loops.

---

## What Is a Loop

A loop runs the same block of code many times.

Without loops, you would copy-paste the same line 100 times.

With loops, you write it once and let Lua repeat it.

---

## The For Loop

The most common loop in Lua.

```lua
for i = 1, 5 do
    print(i)
end
```

Output:

```text
1
2
3
4
5
```

The pattern is:

```text
for  variable  =  start,  stop  do
    -- code
end
```

The variable (`i`) changes each time the loop runs.

It starts at 1 and goes up to 5.

---

## Counting Down

Use a step value to count down.

```lua
for i = 5, 1, -1 do
    print(i)
end
```

Output:

```text
5
4
3
2
1
```

The third number is the step.
Negative steps count down.

---

## Counting by Twos

```lua
for i = 0, 10, 2 do
    print(i)
end
```

Output:

```text
0
2
4
6
8
10
```

The step is 2, so it skips every other number.

---

## Looping Through a Table

Use `ipairs` to loop through an array.

```lua
local fruits = {"apple", "banana", "cherry"}

for index, fruit in ipairs(fruits) do
    print(index, fruit)
end
```

Output:

```text
1  apple
2  banana
3  cherry
```

Use `pairs` to loop through a dictionary.

```lua
local player = {name = "Alex", level = 5, coins = 100}

for key, value in pairs(player) do
    print(key, value)
end
```

Output:

```text
name  Alex
level  5
coins  100
```

Tables are covered in Lesson 08.
For now, know that both `ipairs` and `pairs` exist.

---

## The While Loop

A while loop runs as long as a condition is true.

```lua
local n = 0

while n < 5 do
    print(n)
    n = n + 1
end
```

Output:

```text
0
1
2
3
4
```

The pattern is:

```text
while  condition  do
    -- code
end
```

The condition is checked before each run.

If the condition is false at the start, the loop never runs.

```lua
while false do
    print("never runs")
end
```

---

## The Repeat Loop

A repeat loop runs at least once, then checks the condition.

```lua
local n = 0

repeat
    print(n)
    n = n + 1
until n >= 5
```

Output:

```text
0
1
2
3
4
```

The pattern is:

```text
repeat
    -- code
until  condition
```

The condition is checked after each run.

So the code always runs at least once.

---

## The Difference Between While and Repeat

While checks first, repeat checks last.

```lua
local n = 10

while n < 5 do
    print("while runs")
end
-- never prints

repeat
    print("repeat runs")
until n >= 5
-- prints once
```

Use while when you might not need to run at all.

Use repeat when you always need to run at least once.

---

## Breaking Out of a Loop

Use `break` to stop the loop early.

```lua
for i = 1, 10 do
    if i == 5 then
        break
    end
    print(i)
end
```

Output:

```text
1
2
3
4
```

The loop stops when `i` reaches 5.

---

## Skipping an Iteration

Lua does not have a `continue` keyword.

But you can simulate one with a simple trick.

```lua
for i = 1, 5 do
    if i == 3 then
        -- skip
    else
        print(i)
    end
end
```

Or wrap the body in a function.

```lua
local function process(i)
    if i == 3 then return end
    print(i)
end

for i = 1, 5 do
    process(i)
end
```

Both work. The first is simpler for beginners.

---

## Nested Loops

You can put a loop inside a loop.

```lua
for i = 1, 3 do
    for j = 1, 3 do
        print(i, j)
    end
end
```

Output:

```text
1 1
1 2
1 3
2 1
2 2
2 3
3 1
3 2
3 3
```

The inner loop runs fully for each step of the outer loop.

---

## Infinite Loops

Be careful. It is easy to write a loop that never ends.

```lua
while true do
    print("forever")
end
```

This runs forever.

In Roblox, this will freeze the game.

Always make sure your loop has a way to end.

---

## Useful Patterns

### Wait between iterations

```lua
for i = 1, 5 do
    print("tick " .. i)
    task.wait(1)
end
```

`task.wait(1)` pauses for one second.

### Countdown timer

```lua
local seconds = 10

while seconds > 0 do
    print(seconds)
    task.wait(1)
    seconds = seconds - 1
end

print("Go!")
```

### Spawn enemies in a grid

```lua
for x = 1, 5 do
    for z = 1, 5 do
        local position = Vector3.new(x * 10, 5, z * 10)
        print("Spawn at", position)
    end
end
```

### Loop through players

```lua
local Players = game:GetService("Players")

for _, player in ipairs(Players:GetPlayers()) do
    print(player.Name)
end
```

### Check every part in the workspace

```lua
for _, part in ipairs(workspace:GetChildren()) do
    if part:IsA("Part") then
        print(part.Name)
    end
end
```

---

## Practice

Open Roblox Studio.
Insert a Script into ServerScriptService.
Type this:

```lua
for i = 1, 5 do
    print("Count:", i)
end

local n = 0
while n < 3 do
    print("While:", n)
    n = n + 1
end

local m = 0
repeat
    print("Repeat:", m)
    m = m + 1
until m >= 3
```

Press F5.
Check the Output window.

Now change the numbers.
Run it again.
See how the output changes.

---

## Common Mistakes

Mistake: Forgetting to update the counter in a while loop.

Result: Infinite loop. Game freezes.

```lua
local n = 0
while n < 5 do
    print(n)        -- never changes n
end
```

Fix: Always update the variable in the loop body.

Mistake: Using `<=` when you meant `<`.

Result: Off-by-one errors.

```lua
for i = 1, 5 do       -- runs 5 times
for i = 1, 5, 1 do    -- same
for i = 0, 5 do       -- runs 6 times
```

Mistake: Using the wrong loop variable name.

Result: The loop does not work.

```lua
for i = 1, 5 do
    print(j)    -- ERROR, j is not defined
end
```

Mistake: Trying to modify `i` inside a for loop.

Result: It does not change the loop.

The variable `i` is controlled by the loop.

Mistake: Forgetting `do` or `end`.

Result: Syntax error.

---

## Summary

- For loop counts from a start to a stop value
- Use a step for counting down or skipping
- While loop runs as long as a condition is true
- Repeat loop runs at least once, then checks
- `break` stops the loop early
- Nested loops run inner loops fully each outer step
- Always make sure your loop ends
- Use `task.wait` to pause between iterations

Loops are the engine of every game.
Scores, spawns, timers, UI, all use loops.

---

## Files in This Lesson

- [code/for.lua](code/for.lua) - the for loop
- [code/while.lua](code/while.lua) - the while loop
- [code/repeat.lua](code/repeat.lua) - the repeat loop
- [challenge.md](challenge.md) - your exercise

---

Next: [code/for.md](code/for.md)
