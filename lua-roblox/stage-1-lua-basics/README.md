# 11 - Coroutines

In this lesson you will learn how to run code alongside other code.

You will learn:

- What a coroutine is
- Why coroutines matter
- How to create one
- How to yield and resume
- The Roblox `task` library
- When to use coroutines in a game

Coroutines are how you run things at the same time without stopping the whole script.

---

## What Is a Coroutine

A coroutine is a piece of code that can pause and resume.

Normal code runs from top to bottom.
When it finishes, it stops.

A coroutine can run partway, pause, and let other code run.
Then it can resume where it left off.

Think of it like reading a book.
You can stop at any page, do something else, then come back to where you left off.

---

## Why Coroutines Matter

In a game, many things happen at once.

- Enemies move
- Timers count down
- Effects play
- Music loops
- UI updates

If you wrote all of this in one straight script, the game would freeze.

Coroutines let the game keep running while these tasks happen.

---

## Creating a Coroutine

Use `coroutine.create`.

```lua
local co = coroutine.create(function()
    print("start")
    coroutine.yield()
    print("resume")
end)
```

This creates a coroutine but does not run it yet.

---

## Running a Coroutine

Use `coroutine.resume`.

```lua
coroutine.resume(co)     -- prints start
```

The coroutine runs until it hits a `yield`.
Then it pauses.

Run it again:

```lua
coroutine.resume(co)     -- prints resume
```

The coroutine resumes after the yield and continues.

---

## Checking the Status

```lua
local co = coroutine.create(function()
    coroutine.yield()
end)

print(coroutine.status(co))     -- suspended
coroutine.resume(co)
print(coroutine.status(co))     -- suspended
coroutine.resume(co)
print(coroutine.status(co))     -- dead
```

Statuses:

- `suspended` - not running, waiting to resume
- `running` - currently running
- `dead` - finished

---

## The Roblox task Library

Roblox provides easier ways to do the same thing.

The `task` library is what you will use in real Roblox code.

### task.spawn

Runs a function in a new thread immediately.

```lua
task.spawn(function()
    print("runs in parallel")
end)

print("main code")
```

Output:

```text
runs in parallel
main code
```

Both run at the same time.

### task.wait

Pauses the current thread for a number of seconds.

```lua
print("start")
task.wait(2)
print("after 2 seconds")
```

The thread pauses. Other code keeps running.

### task.delay

Runs a function after a delay.

```lua
task.delay(3, function()
    print("3 seconds later")
end)

print("this runs first")
```

Output:

```text
this runs first
3 seconds later
```

### task.defer

Runs a function after the current script finishes the current step.

```lua
task.defer(function()
    print("deferred")
end)

print("main")
```

Output:

```text
main
deferred
```

---

## A Timer Example

```lua
task.spawn(function()
    for i = 10, 1, -1 do
        print(i)
        task.wait(1)
    end
    print("Go!")
end)

print("Timer started")
```

Output:

```text
Timer started
10
9
8
7
6
5
4
3
2
1
Go!
```

The timer runs while other code continues.

---

## A Loop That Never Blocks

```lua
task.spawn(function()
    while true do
        print("tick")
        task.wait(1)
    end
end)

print("Main script finished")
```

The main script finishes immediately.
The loop keeps running forever in the background.

---

## Spawning Multiple Tasks

```lua
for i = 1, 5 do
    task.spawn(function()
        local id = i
        for step = 1, 3 do
            print("Task " .. id .. " step " .. step)
            task.wait(0.5)
        end
    end)
end
```

All five tasks run at the same time.
Their outputs are interleaved.

---

## Combining with Loops

```lua
local function countdown(seconds)
    for i = seconds, 1, -1 do
        print(i)
        task.wait(1)
    end
    print("Done")
end

task.spawn(function() countdown(5) end)
task.spawn(function() countdown(3) end)
```

Both countdowns run at the same time.

---

## Spawning an Effect

```lua
local function playExplosion(position)
    print("Boom at " .. tostring(position))
    task.wait(0.5)
    print("Smoke fades")
end

task.spawn(function()
    playExplosion(Vector3.new(0, 0, 0))
end)

print("Player took damage")
```

The explosion runs in the background.
The damage happens immediately.

---

## Waiting for Something to Exist

```lua
task.spawn(function()
    local part = workspace:WaitForChild("MyPart")
    print("Found the part: " .. part.Name)
end)

print("Script continues")
```

The wait happens in a separate thread.
The main script keeps running.

---

## Cancelling a Task

Roblox coroutines can be cancelled.

```lua
local thread = task.spawn(function()
    while true do
        print("running")
        task.wait(1)
    end
end)

task.wait(3)
task.cancel(thread)
print("Task cancelled")
```

The loop stops after 3 seconds.

---

## A Regen Example

```lua
local function startRegen(player)
    task.spawn(function()
        while player.Health < player.MaxHealth do
            player.Health = math.min(player.Health + 5, player.MaxHealth)
            print("Health: " .. player.Health)
            task.wait(1)
        end
        print("Fully healed")
    end)
end
```

The regen runs in the background.
The rest of the game keeps going.

---

## A Cooldown Example

```lua
local onCooldown = false

local function useAbility()
    if onCooldown then
        print("Ability on cooldown")
        return
    end

    onCooldown = true
    print("Ability used")

    task.delay(3, function()
        onCooldown = false
        print("Ability ready")
    end)
end

useAbility()
useAbility()     -- blocked
task.wait(3.5)
useAbility()     -- works again
```

---

## A Real Roblox Pattern

Every Roblox game has loops running in the background.

```lua
task.spawn(function()
    while true do
        -- Update something every frame
        task.wait()
    end
end)
```

`task.wait()` with no number waits one frame.

This is how you update UI, check conditions, and run timers.

---

## Common Mistakes

Mistake 1: Using `coroutine` when `task` is simpler.

In Roblox, always use `task`.
It handles edge cases better.

Mistake 2: Forgetting `task.wait` inside a loop.

```lua
task.spawn(function()
    while true do
        print("this runs thousands of times per second")
    end
end)
```

This crashes the game.
Always include a `task.wait`.

Mistake 3: Using `wait()` instead of `task.wait()`.

`wait` is deprecated.
Use `task.wait`.

Mistake 4: Expecting spawned code to finish before the main script continues.

```lua
task.spawn(function()
    task.wait(5)
    print("after 5 seconds")
end)

print("right away")
```

`right away` prints first.

Mistake 5: Forgetting to cancel long-running tasks.

Tasks that run forever leak memory.
Cancel them when you no longer need them.

Mistake 6: Modifying shared data without coordination.

Two coroutines editing the same table can cause bugs.
Be careful with shared state.

---

## Summary

- A coroutine is code that can pause and resume
- Roblox provides the `task` library
- `task.spawn` runs a function in a new thread
- `task.wait` pauses the current thread
- `task.delay` runs a function later
- `task.cancel` stops a task
- Use coroutines for timers, effects, and background loops
- Always include `task.wait` in infinite loops
- Use `task` instead of `coroutine` in Roblox

You now know how to run multiple things at once.
This is how every real game works.

---

## Files in This Lesson

- [code/basics.lua](code/basics.lua) - coroutine basics
- [code/spawn.lua](code/spawn.lua) - task.spawn examples
- [code/delay.lua](code/delay.lua) - task.delay examples
- [challenge.md](challenge.md) - your exercise

---

Next: [code/basics.md](code/basics.md)
