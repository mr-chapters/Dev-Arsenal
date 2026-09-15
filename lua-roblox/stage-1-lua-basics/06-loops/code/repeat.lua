# repeat.lua

The repeat loop in Lua.

A repeat loop runs the code at least once, then checks the condition.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Basic Pattern

```
local n = 0

repeat
    print(n)
    n = n + 1
until n >= 5
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
repeat
    -- code
until  condition
```

The condition is checked after each run.

So the code always runs at least once.

---

## How It Differs From While

A while loop checks the condition first.

```
local n = 10

while n < 5 do
    print("while")
end
-- never prints, because 10 is not less than 5
```

A repeat loop checks the condition last.

```
local n = 10

repeat
    print("repeat")
until n < 5
-- prints once, because the check happens after
```

Use while when the code might not need to run.

Use repeat when you always want it to run at least once.

---

## A Menu Example

Repeat is perfect for a menu that should always appear at least once.

```
local choice = ""

repeat
    print("1. Play")
    print("2. Options")
    print("3. Quit")
    choice = "3"     -- pretend the user picked quit
until choice == "3"

print("Goodbye")
```

Output:

```
1. Play
2. Options
3. Quit
Goodbye
```

---

## A Password Prompt

```
local attempts = 0
local correctPassword = "secret"
local input = "wrong"

repeat
    attempts = attempts + 1
    print("Attempt " .. attempts .. ": trying " .. input)
    input = "secret"     -- pretend the user entered the right password
until input == correctPassword

print("Access granted after " .. attempts .. " attempt(s)")
```

Output:

```
Attempt 1: trying wrong
Access granted after 1 attempt(s)
```

---

## A Roll Until Success

```
local rolls = 0
local target = 6
local roll = 0

repeat
    rolls = rolls + 1
    roll = math.random(1, 6)
    print("Roll " .. rolls .. ": " .. roll)
until roll == target

print("Got a " .. target .. " in " .. rolls .. " rolls")
```

Run it a few times.
The number of rolls changes each run.

---

## Combining With Break

You can break out of a repeat loop early.

```
local n = 0

repeat
    n = n + 1
    print(n)

    if n == 3 then
        break
    end
until n >= 100

print("Stopped early at " .. n)
```

Output:

```
1
2
3
Stopped early at 3
```

---

## Combining With a Counter

A common pattern is a counter that increments until a limit.

```
local count = 0

repeat
    count = count + 1
    print("Tick " .. count)
until count >= 5

print("Done")
```

Output:

```
Tick 1
Tick 2
Tick 3
Tick 4
Tick 5
Done
```

---

## A Game Loop Example

```
local gameRunning = true
local turns = 0

repeat
    turns = turns + 1
    print("Turn " .. turns)

    if turns >= 3 then
        gameRunning = false
    end
until not gameRunning

print("Game over after " .. turns .. " turns")
```

---

## Waiting Between Iterations

```
local seconds = 5

repeat
    print(seconds)
    task.wait(1)
    seconds = seconds - 1
until seconds <= 0

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

## Real Roblox Use Case

Wait until a part exists in the workspace.

```
local part
repeat
    part = workspace:FindFirstChild("MyPart")
    task.wait(0.1)
until part

print("Found the part: " .. part.Name)
```

This keeps checking every 0.1 seconds until the part appears.

---

## Comparing All Three Loops

```
-- For: knows how many times to run
for i = 1, 5 do
    print("for", i)
end

-- While: runs while a condition is true
local w = 0
while w < 5 do
    print("while", w)
    w = w + 1
end

-- Repeat: runs at least once, then checks
local r = 0
repeat
    print("repeat", r)
    r = r + 1
until r >= 5
```

All three print the same values.
But the logic is different.

---

## Common Mistakes

Mistake 1: Forgetting `until`.

```
repeat
    print("hi")     -- ERROR, missing until
```

Mistake 2: Forgetting the condition after `until`.

```
repeat
    print("hi")
until               -- ERROR, missing condition
```

Mistake 3: Writing `while` when you meant `repeat`.

```
while n < 5
    print(n)
end
-- this is a while loop, not a repeat loop
```

Mistake 4: Using `end` instead of `until`.

```
repeat
    print("hi")
end                 -- ERROR
```

Repeat uses `until`, not `end`.

Mistake 5: Forgetting that the condition is checked last.

```
local n = 100

repeat
    print("runs once")
until n < 5
```

This still prints once, even though the condition is false.

---

## What You Learned

- Repeat loops run at least once
- The condition is checked after each run
- Use `until` instead of `end`
- Good for menus, prompts, and retry loops
- You can break out early
- Use `task.wait` to pause between iterations
