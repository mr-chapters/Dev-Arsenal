# while.lua

The while loop in Lua.

A while loop runs as long as a condition is true.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Basic Pattern

```
local n = 0

while n < 5 do
    print(n)
    n = n + 1
end
```

Output:

```
0
1
2
3
4
```

The pattern is:

```
while  condition  do
    -- code
end
```

The condition is checked before each run.

If the condition is false at the start, the loop never runs.

---

## The Condition Is Checked First

```
local n = 10

while n < 5 do
    print("this never runs")
end
```

Because 10 is not less than 5, the loop body is skipped.

This is different from repeat, which always runs at least once.

---

## Counting Up

```
local n = 1

while n <= 5 do
    print(n)
    n = n + 1
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

You control the counter yourself.
The loop does not have a built-in counter like the for loop.

---

## Counting Down

```
local n = 5

while n >= 1 do
    print(n)
    n = n - 1
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

---

## Counting by Twos

```
local n = 0

while n <= 10 do
    print(n)
    n = n + 2
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

---

## A Password Check

```
local attempts = 0
local correct = "secret"
local input = "wrong"

while input ~= correct do
    attempts = attempts + 1
    print("Attempt " .. attempts)
    input = "secret"     -- pretend the user entered the right password
end

print("Access granted after " .. attempts .. " attempt(s)")
```

Output:

```
Attempt 1
Access granted after 1 attempt(s)
```

---

## A Countdown Timer

```
local seconds = 5

while seconds > 0 do
    print(seconds)
    task.wait(1)
    seconds = seconds - 1
end

print("Go!")
```

Output (one line per second):

```
5
4
3
2
1
Go!
```

---

## A Health Regeneration Loop

```
local health = 50
local maxHealth = 100
local regenRate = 5

while health < maxHealth do
    health = health + regenRate
    if health > maxHealth then
        health = maxHealth
    end
    print("Health: " .. health)
    task.wait(1)
end

print("Fully healed")
```

---

## Breaking Out of a Loop

Use `break` to stop the loop early.

```
local n = 0

while true do
    n = n + 1
    print(n)

    if n == 5 then
        break
    end
end

print("Stopped at " .. n)
```

Output:

```
1
2
3
4
5
Stopped at 5
```

Using `while true` with a break is a common pattern for loops that must run at least once and end based on internal logic.

---

## Waiting for a Part to Exist

A very common Roblox pattern.

```
local part = workspace:FindFirstChild("MyPart")
local attempts = 0

while not part and attempts < 50 do
    attempts = attempts + 1
    task.wait(0.1)
    part = workspace:FindFirstChild("MyPart")
end

if part then
    print("Found it after " .. attempts .. " tries")
else
    print("Gave up after " .. attempts .. " tries")
end
```

The loop keeps checking until the part exists or 50 tries have passed.

---

## Looping Through a Table with a Counter

```
local fruits = {"apple", "banana", "cherry"}
local index = 1

while index <= #fruits do
    print(index, fruits[index])
    index = index + 1
end
```

Output:

```
1  apple
2  banana
3  cherry
```

You can do this with a for loop too.
The while version is more manual.

---

## Player Distance Check

```
local distance = 100
local speed = 15

while distance > 0 do
    distance = distance - speed
    if distance < 0 then
        distance = 0
    end
    print("Distance left: " .. distance)
    task.wait(0.5)
end

print("Arrived")
```

---

## The Infinite Loop Danger

```
while true do
    print("forever")
end
```

This runs forever.
In Roblox, this will freeze the game.

Always make sure your while loop has a way to end.

Add a break condition, a counter, or a task.wait inside.

```
local n = 0

while true do
    n = n + 1
    print(n)
    task.wait(0.1)

    if n >= 10 then
        break
    end
end
```

---

## While vs For

Use `for` when you know how many times to run.
Use `while` when you do not know.

```
-- For: you know it is 5 times
for i = 1, 5 do
    print(i)
end

-- While: keep going until something happens
local running = true
while running do
    print("checking...")
    task.wait(1)
    running = false
end
```

---

## Common Mistakes

Mistake 1: Forgetting to update the counter.

```
local n = 0
while n < 5 do
    print(n)        -- n never changes, infinite loop
end
```

Fix: Always update the variable inside the loop.

Mistake 2: Using `=` instead of `==` in the condition.

```
while n = 5 do      -- ERROR
while n == 5 do     -- OK
```

Mistake 3: Forgetting `do` or `end`.

```
while n < 5         -- ERROR
while n < 5 do      -- OK
```

Mistake 4: Writing a condition that is never false.

```
local n = 0
while n >= 0 do
    n = n + 1       -- n grows forever
end
```

Mistake 5: Expecting while to run at least once.

```
local n = 10
while n < 5 do
    print("never runs")
end
```

If you need it to run at least once, use `repeat`.

---

## What You Learned

- While loops run as long as the condition is true
- The condition is checked before each run
- If the condition is false first, the loop never runs
- You update the counter yourself
- Use `break` to stop early
- Use `while true` with a break for "always run" loops
- Always make sure the loop ends
- Add `task.wait` to avoid freezing the game
