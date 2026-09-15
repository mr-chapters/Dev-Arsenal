
# spawn.lua

The `task.spawn` function in Roblox.

`task.spawn` runs a function in a new thread immediately.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Basic Pattern

```lua
task.spawn(function()
    print("runs in a new thread")
end)

print("main code")
```

Output:

```text
runs in a new thread
main code
```

Both run at the same time.

---

## Spawning a Named Function

```lua
local function doWork()
    print("working")
end

task.spawn(doWork)
```

The function is passed to spawn.
It runs in the new thread.

---

## Passing Arguments

```lua
task.spawn(function(name, level)
    print(name .. " is level " .. level)
end, "Alex", 5)
```

Output:

```text
Alex is level 5
```

Arguments come after the function.

---

## A Loop in the Background

```lua
task.spawn(function()
    while true do
        print("tick")
        task.wait(1)
    end
end)

print("main script finished")
```

Output:

```text
main script finished
tick
tick
tick
...
```

The main script finishes immediately.
The loop keeps running.

Always include a `task.wait` in an infinite loop.
Without it, the game freezes.

---

## Multiple Tasks

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

Output (interleaved):

```text
Task 1 step 1
Task 2 step 1
Task 3 step 1
Task 4 step 1
Task 5 step 1
Task 1 step 2
Task 2 step 2
...
```

All five tasks run at the same time.

---

## Capturing the Loop Variable

When you spawn inside a loop, capture `i` in a local.

```lua
for i = 1, 3 do
    task.spawn(function()
        local id = i     -- capture here
        task.wait(1)
        print("Task " .. id)
    end)
end
```

Without the local, all tasks may share the same `i`.
Always capture the value you need.

---

## A Countdown

```lua
local function countdown(seconds, label)
    for i = seconds, 1, -1 do
        print(label .. ": " .. i)
        task.wait(1)
    end
    print(label .. ": done")
end

task.spawn(function() countdown(5, "Timer A") end)
task.spawn(function() countdown(3, "Timer B") end)
```

Output:

```text
Timer A: 5
Timer B: 3
Timer A: 4
Timer B: 2
Timer A: 3
Timer B: 1
Timer B: done
Timer A: 2
Timer A: 1
Timer A: done
```

The two countdowns run side by side.

---

## Spawning an Effect

```lua
local function playExplosion(position)
    print("Boom at " .. tostring(position))
    task.wait(0.5)
    print("Smoke clears")
end

task.spawn(function()
    playExplosion(Vector3.new(0, 0, 0))
end)

print("Player took damage")
```

The explosion runs in the background.
The damage happens immediately.

---

## Spawning a Regen Loop

```lua
local health = 50
local maxHealth = 100

task.spawn(function()
    while health < maxHealth do
        health = health + 5
        if health > maxHealth then
            health = maxHealth
        end
        print("HP: " .. health)
        task.wait(1)
    end
    print("Fully healed")
end)
```

---

## Spawning a Cooldown

```lua
local onCooldown = false

local function useAbility()
    if onCooldown then
        print("On cooldown")
        return
    end
    onCooldown = true
    print("Ability used")

    task.spawn(function()
        task.wait(3)
        onCooldown = false
        print("Ability ready")
    end)
end

useAbility()
useAbility()
```

Output:

```text
Ability used
On cooldown
Ability ready
```

---

## Spawning with a Return Value

`task.spawn` does not return a value.
If you need the return, use `coroutine.wrap` or call the function directly.

```lua
local function add(a, b)
    return a + b
end

task.spawn(add, 2, 3)     -- runs, but no return value captured
```

For simple work, this is fine.
For return values, use a different approach.

---

## When to Use spawn

Use `task.spawn` when you want code to run at the same time as the rest of the script.

- Timers
- Effects
- Background loops
- Parallel tasks
- Anything that waits

Do not use it for code that must finish before the next line.

---

## Common Mistakes

Mistake 1: Forgetting `task.wait` in an infinite loop.

```lua
task.spawn(function()
    while true do
        print("freeze")
    end
end)
```

This freezes the game.

Mistake 2: Expecting spawned code to run first.

```lua
task.spawn(function()
    print("spawn")
end)
print("main")
```

Output is `spawn` then `main` only if the spawn runs first.
The order is not guaranteed.

Mistake 3: Sharing variables without care.

Two tasks editing the same variable can cause bugs.

Mistake 4: Forgetting to capture the loop variable.

```lua
for i = 1, 3 do
    task.spawn(function()
        print(i)     -- may all print the same number
    end)
end
```

Capture `i` in a local inside the loop.

Mistake 5: Using `spawn` (the old function) instead of `task.spawn`.

The old `spawn` is deprecated.
Use `task.spawn`.

---

## Summary

- `task.spawn` runs a function in a new thread
- The rest of the script keeps running
- Pass arguments after the function
- Always include `task.wait` in loops
- Capture loop variables in locals
- Use it for timers, effects, and background work
