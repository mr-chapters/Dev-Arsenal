# for.lua

The for loop in Lua.

The for loop repeats code a set number of times.
It is the most common loop in Roblox.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Basic Pattern

```
for i = 1, 5 do
    print(i)
end
```

Output:

```
1
2
3
4
5
```

The pattern is:

```
for  variable  =  start,  stop  do
    -- code
end
```

The variable (`i`) starts at 1 and counts up to 5.

---

## Counting Down

Add a step value to count down.

```
for i = 5, 1, -1 do
    print(i)
end
```

Output:

```
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

```
for i = 0, 10, 2 do
    print(i)
end
```

Output:

```
0
2
4
6
8
10
```

The step is 2, so it skips every other number.

---

## Counting by Fives

```
for i = 5, 50, 5 do
    print(i)
end
```

Output:

```
5
10
15
20
25
30
35
40
45
50
```

---

## The Loop Variable Name

The variable name is usually `i`.
But you can name it anything.

```
for number = 1, 3 do
    print(number)
end

for count = 1, 3 do
    print(count)
end
```

Use `i` for short loops.
Use a descriptive name for longer ones.

---

## Using the Variable in the Body

You can use the loop variable anywhere inside the loop.

```
for i = 1, 5 do
    print("Square of " .. i .. " is " .. (i * i))
end
```

Output:

```
Square of 1 is 1
Square of 2 is 4
Square of 3 is 9
Square of 4 is 16
Square of 5 is 25
```

---

## Breaking Out of a Loop

Use `break` to stop early.

```
for i = 1, 10 do
    if i == 5 then
        break
    end
    print(i)
end
```

Output:

```
1
2
3
4
```

The loop stops when `i` reaches 5.

---

## Skipping an Iteration

Lua does not have `continue`.
But you can use an if to skip work.

```
for i = 1, 5 do
    if i == 3 then
        -- do nothing
    else
        print(i)
    end
end
```

Output:

```
1
2
4
5
```

---

## Looping Through a Table

Use `ipairs` for arrays.

```
local fruits = {"apple", "banana", "cherry"}

for index, fruit in ipairs(fruits) do
    print(index, fruit)
end
```

Output:

```
1  apple
2  banana
3  cherry
```

The first variable is the index (1, 2, 3).
The second variable is the value.

Use `pairs` for dictionaries.

```
local player = {name = "Alex", level = 5, coins = 100}

for key, value in pairs(player) do
    print(key, value)
end
```

Output:

```
name   Alex
level  5
coins  100
```

Tables are covered in Lesson 08.

---

## The Underscore Convention

If you do not need the index, use `_`.

```
local fruits = {"apple", "banana", "cherry"}

for _, fruit in ipairs(fruits) do
    print(fruit)
end
```

The `_` means "I do not care about this value".

This is a common Lua convention.

---

## Nested For Loops

You can put a for loop inside another.

```
for i = 1, 3 do
    for j = 1, 3 do
        print(i, j)
    end
end
```

Output:

```
1  1
1  2
1  3
2  1
2  2
2  3
3  1
3  2
3  3
```

The inner loop runs fully for each step of the outer loop.

Total iterations: 3 times 3 equals 9.

---

## A Grid Example

Spawn parts in a grid.

```
for x = 1, 5 do
    for z = 1, 5 do
        local px = x * 10
        local pz = z * 10
        print("Spawn at " .. px .. ", " .. pz)
    end
end
```

This is how you build grids in Roblox.

---

## A Health Bar Example

```
local maxHealth = 100
local currentHealth = 75

local bars = 10
local filled = math.floor((currentHealth / maxHealth) * bars)

local bar = "["
for i = 1, bars do
    if i <= filled then
        bar = bar .. "="
    else
        bar = bar .. "-"
    end
end
bar = bar .. "]"

print(bar)      -- [=======---]
```

---

## A Countdown Timer

```
for i = 10, 1, -1 do
    print(i)
    task.wait(1)
end

print("Go!")
```

`task.wait(1)` pauses one second between prints.

---

## Looping Through Players

```
local Players = game:GetService("Players")

for _, player in ipairs(Players:GetPlayers()) do
    print(player.Name)
end
```

This prints every player in the game.

---

## Looping Through Parts

```
for _, part in ipairs(workspace:GetChildren()) do
    if part:IsA("Part") then
        print(part.Name)
    end
end
```

This prints the name of every Part in the workspace.

---

## Common Mistakes

Mistake 1: Forgetting `do`.

```
for i = 1, 5          -- ERROR
for i = 1, 5 do       -- OK
```

Mistake 2: Forgetting `end`.

```
for i = 1, 5 do
    print(i)          -- ERROR, missing end
```

Mistake 3: Changing the loop variable inside the body.

```
for i = 1, 5 do
    i = i + 1         -- does nothing useful
end
```

The loop controls `i` itself.

Mistake 4: Using the loop variable after the loop ends.

```
for i = 1, 5 do
end

print(i)              -- nil, i is gone
```

Mistake 5: Expecting the loop to be exclusive.

```
for i = 1, 5 do       -- runs 5 times (1, 2, 3, 4, 5)
```

Both ends are included.

---

## What You Learned

- For loops count from a start to a stop value
- Add a step to count down or skip
- Use `break` to stop early
- Use `ipairs` for arrays and `pairs` for dictionaries
- Use `_` when you do not need the index
- Nested for loops build grids
- The loop variable is only available inside the loop
- Both ends of the range are included
