
# delay.lua

The `task.delay` function in Roblox.

`task.delay` runs a function after a delay.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Basic Pattern

```lua
task.delay(2, function()
    print("2 seconds later")
end)

print("this runs first")
```

Output:

```text
this runs first
2 seconds later
```

The delayed function runs after 2 seconds.

---

## Passing Arguments

```lua
task.delay(1, function(name)
    print("Hello, " .. name)
end, "Alex")
```

Output after 1 second:

```text
Hello, Alex
```

Arguments come after the function.

---

## Multiple Delays

```lua
task.delay(1, function() print("1 second") end)
task.delay(2, function() print("2 seconds") end)
task.delay(3, function() print("3 seconds") end)
task.delay(4, function() print("4 seconds") end)
```

Output:

```text
1 second
2 seconds
3 seconds
4 seconds
```

Each fires at its own time.

---

## A Cooldown System

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
useAbility()
```

Output:

```text
Ability used
Ability on cooldown
```

Then 3 seconds later:

```text
Ability ready
```

---

## A Respawn Timer

```lua
local function respawnPlayer(player)
    print(player .. " died")

    task.delay(5, function()
        print(player .. " respawned")
    end)
end

respawnPlayer("Alex")
print("Other players keep playing")
```

Output:

```text
Alex died
Other players keep playing
```

Then 5 seconds later:

```text
Alex respawned
```

---

## A Delayed Message

```lua
print("Game starting in...")
task.delay(1, function() print("3") end)
task.delay(2, function() print("2") end)
task.delay(3, function() print("1") end)
task.delay(4, function() print("Go!") end)
```

Output over 4 seconds:

```text
Game starting in...
3
2
1
Go!
```

---

## Delayed Damage

```lua
local function applyDamage(target, amount, delay)
    print("Effect plays")

    task.delay(delay, function()
        target.health = target.health - amount
        print(target.name .. " took " .. amount .. " damage")
    end)
end

local target = {name = "Enemy", health = 100}
applyDamage(target, 25, 1)
print("Waiting for impact")
```

Output:

```text
Effect plays
Waiting for impact
```

Then 1 second later:

```text
Enemy took 25 damage
```

---

## A Grenade Example

```lua
local function throwGrenade(position)
    print("Grenade thrown")

    task.delay(3, function()
        print("Grenade explodes at " .. tostring(position))
        -- damage nearby players here
    end)
end

throwGrenade(Vector3.new(10, 0, 5))
print("Player runs away")
```

---

## A Heal Over Time

```lua
local function healOverTime(target, total, duration, ticks)
    local healPerTick = total / ticks
    local waitBetween = duration / ticks

    for i = 1, ticks do
        task.delay(waitBetween * i, function()
            target.health = target.health + healPerTick
            if target.health > target.maxHealth then
                target.health = target.maxHealth
            end
            print("Healed: " .. target.health)
        end)
    end
end

local player = {health = 50, maxHealth = 100}
healOverTime(player, 50, 5, 5)
```

This heals 10 HP every second for 5 seconds.

---

## A Bomb Fuse

```lua
local function startBomb(fuse)
    print("Bomb planted. " .. fuse .. " seconds until explosion.")

    for i = fuse, 1, -1 do
        task.delay(fuse - i + 1, function()
            print(i)
        end)
    end

    task.delay(fuse + 1, function()
        print("BOOM")
    end)
end

startBomb(5)
```

---

## Combining with spawn

`task.delay` is non-blocking.
The rest of the script keeps running.

```lua
task.delay(2, function()
    print("delayed")
end)

task.spawn(function()
    for i = 1, 5 do
        print("loop " .. i)
        task.wait(0.5)
    end
end)
```

Both run at the same time.

---

## Cancel a Delayed Task

`task.delay` returns a thread you can cancel.

```lua
local thread = task.delay(5, function()
    print("this may not run")
end)

task.wait(2)
task.cancel(thread)
print("Cancelled the delayed task")
```

The delayed function never runs.

---

## When to Use delay

Use `task.delay` when:

- Something should happen after a wait
- You do not want to block the main script
- You are scheduling a single event

Use `task.spawn` with a `task.wait` inside for longer sequences.

---

## Common Mistakes

Mistake 1: Expecting the main script to wait.

```lua
task.delay(3, function() print("delayed") end)
print("right away")
```

`right away` prints first.

Mistake 2: Forgetting the function.

```lua
task.delay(2)     -- ERROR, no function
task.delay(2, function() print("hi") end)     -- OK
```

Mistake 3: Passing arguments in the wrong order.

```lua
task.delay(function() end, 2)     -- ERROR
task.delay(2, function() end)     -- OK
```

The delay comes first, then the function, then arguments.

Mistake 4: Using delay for long loops.

`task.delay` runs once.
For repeats, use a loop inside `task.spawn`.

Mistake 5: Forgetting to cancel if the situation changes.

Store the thread and cancel it.

---

## Summary

- `task.delay` runs a function after a wait
- The main script does not block
- Pass arguments after the function
- Returns a thread you can cancel
- Use it for cooldowns, timers, and delayed events
- Combine with `task.spawn` for complex timing
