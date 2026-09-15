# Challenge 11 - Coroutines

This is your exercise for Lesson 11.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that uses coroutines and the task library to run multiple things at once.

The script must:

- Use `task.spawn` at least once
- Use `task.wait` at least once
- Use `task.delay` at least once
- Run a countdown while other code keeps going
- Run two or more tasks in parallel

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
=== Task Demo ===

Main script starts
Task 1 spawned
Task 2 spawned

Main script continues

Task 1: 3
Task 2: A
Task 1: 2
Task 2: B
Task 1: 1
Task 2: C
Task 1: done

After 2 seconds
Delayed message

Task 2: done
```

Your values will be different. That is fine.
The order may vary.
The structure is what matters.

---

## Requirements

Your script must include:

- At least one `task.spawn`
- At least one `task.wait`
- At least one `task.delay`
- At least two tasks running in parallel
- At least one loop inside a task
- At least one print outside the tasks to show the main script keeps running

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Write a countdown function that takes seconds and prints each second.

```lua
local function countdown(seconds)
    for i = seconds, 1, -1 do
        print(i)
        task.wait(1)
    end
    print("Go!")
end

task.spawn(function() countdown(5) end)
```

### Bonus 2

Run three countdowns at the same time with different starting numbers.

### Bonus 3

Write a cooldown system.

```lua
local onCooldown = false

local function useAbility()
    if onCooldown then
        print("On cooldown")
        return
    end
    onCooldown = true
    print("Used ability")
    task.delay(3, function()
        onCooldown = false
        print("Ready again")
    end)
end

useAbility()
useAbility()
task.wait(3.5)
useAbility()
```

### Bonus 4

Write a health regeneration loop.

```lua
local health = 50
local maxHealth = 100

task.spawn(function()
    while health < maxHealth do
        health = health + 10
        if health > maxHealth then
            health = maxHealth
        end
        print("HP: " .. health)
        task.wait(1)
    end
    print("Fully healed")
end)
```

### Bonus 5

Spawn multiple enemies that each move on their own timer.

```lua
for i = 1, 5 do
    task.spawn(function()
        local id = i
        for step = 1, 3 do
            print("Enemy " .. id .. " step " .. step)
            task.wait(math.random(5, 15) / 10)
        end
    end)
end
```

### Bonus 6

Cancel a task.

```lua
local thread = task.spawn(function()
    while true do
        print("running")
        task.wait(1)
    end
end)

task.wait(3)
task.cancel(thread)
print("Cancelled")
```

---

## Hints

Hint for spawning:

```lua
task.spawn(function()
    print("in a new thread")
end)
```

Hint for waiting:

```lua
task.wait(1)     -- wait 1 second
task.wait(0.5)   -- wait half a second
task.wait()      -- wait one frame
```

Hint for delaying:

```lua
task.delay(2, function()
    print("2 seconds later")
end)
```

Hint for a countdown:

```lua
for i = 5, 1, -1 do
    print(i)
    task.wait(1)
end
print("Go!")
```

Hint for two tasks:

```lua
task.spawn(function()
    for i = 1, 5 do
        print("A", i)
        task.wait(1)
    end
end)

task.spawn(function()
    for i = 1, 5 do
        print("B", i)
        task.wait(1)
    end
end)
```

Hint for cancelling:

```lua
local thread = task.spawn(function()
    while true do
        task.wait(1)
    end
end)

task.cancel(thread)
```

---

## Common Mistakes to Avoid

- Forgetting `task.wait` inside a loop (crashes the game)
- Using `wait()` instead of `task.wait()`
- Expecting spawned code to run before the main script continues
- Using `coroutine` instead of `task` in Roblox
- Forgetting to cancel long-running tasks
- Modifying shared variables without care
- Forgetting to press F5 to run the script

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Creating coroutines with task.spawn
- Pausing with task.wait
- Scheduling with task.delay
- Running multiple tasks in parallel
- Cancelling tasks
- Managing timers and cooldowns

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I used task.spawn
- [ ] I used task.wait
- [ ] I used task.delay
- [ ] I ran two tasks in parallel
- [ ] The main script continued while tasks ran
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, you have finished Stage 1.

---

## Stage 1 Complete

You now know the Lua language.

Next up is Stage 2 - Roblox Systems.
You will learn how to use the Roblox engine itself.

When you are ready, move to [stage-2-roblox-systems](../../stage-2-roblox-systems/README.md).

---

Next: [stage-2-roblox-systems](../../stage-2-roblox-systems/README.md)
