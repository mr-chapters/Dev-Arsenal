# basics.lua

Coroutine basics in Lua.

A coroutine is a piece of code that can pause and resume.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

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

The function inside is not run yet.
It runs when you resume the coroutine.

---

## Resuming a Coroutine

Use `coroutine.resume`.

```lua
coroutine.resume(co)     -- prints start
```

The coroutine runs until it hits a `yield`.
Then it pauses.

Resume it again:

```lua
coroutine.resume(co)     -- prints resume
```

The coroutine continues from where it paused.

---

## Checking the Status

```lua
print(coroutine.status(co))     -- suspended
coroutine.resume(co)
print(coroutine.status(co))     -- suspended
coroutine.resume(co)
print(coroutine.status(co))     -- dead
```

Statuses:

- `suspended` - not running
- `running` - currently running
- `dead` - finished

---

## Multiple Yields

A coroutine can yield many times.

```lua
local co = coroutine.create(function()
    print("step 1")
    coroutine.yield()
    print("step 2")
    coroutine.yield()
    print("step 3")
end)

coroutine.resume(co)     -- step 1
coroutine.resume(co)     -- step 2
coroutine.resume(co)     -- step 3
coroutine.resume(co)     -- nothing
```

After the function ends, the coroutine is dead.
Further resumes do nothing.

---

## Passing Values In

You can pass values to a coroutine when resuming.

```lua
local co = coroutine.create(function(a, b)
    print("received:", a, b)
    local c = coroutine.yield()
    print("received after yield:", c)
end)

coroutine.resume(co, 1, 2)
coroutine.resume(co, 99)
```

Output:

```text
received: 1  2
received after yield: 99
```

---

## Getting Values Out

Yields and returns can send values back.

```lua
local co = coroutine.create(function()
    coroutine.yield("hello")
    return "done"
end)

local ok1, value1 = coroutine.resume(co)
print(ok1, value1)     -- true  hello

local ok2, value2 = coroutine.resume(co)
print(ok2, value2)     -- true  done
```

The first value from resume is success (true or false).
The rest are what the coroutine yielded or returned.

---

## A Simple Counter

```lua
local co = coroutine.create(function()
    local n = 0
    while true do
        n = n + 1
        coroutine.yield(n)
    end
end)

print(coroutine.resume(co))     -- true  1
print(coroutine.resume(co))     -- true  2
print(coroutine.resume(co))     -- true  3
```

The coroutine keeps its state between resumes.

---

## Checking if a Coroutine Is Dead

```lua
local co = coroutine.create(function()
    print("done")
end)

print(coroutine.status(co))     -- suspended
coroutine.resume(co)
print(coroutine.status(co))     -- dead
```

Use `coroutine.status` to check.

---

## The Wrap Function

`coroutine.wrap` returns a function instead of a coroutine object.

```lua
local counter = coroutine.wrap(function()
    local n = 0
    while true do
        n = n + 1
        coroutine.yield(n)
    end
end)

print(counter())     -- 1
print(counter())     -- 2
print(counter())     -- 3
```

You call the result directly, without using `resume`.

---

## In Roblox, Use task Instead

Roblox provides the `task` library, which is easier.

```lua
task.spawn(function()
    print("runs in a new thread")
end)
```

The `task` library handles the details for you.

In Roblox code, always use `task` instead of `coroutine`.
It is safer and simpler.

---

## A Roblox Example

```lua
task.spawn(function()
    for i = 1, 5 do
        print("tick " .. i)
        task.wait(1)
    end
end)

print("main script continues")
```

Output:

```text
main script continues
tick 1
tick 2
tick 3
tick 4
tick 5
```

The main script does not wait for the loop.

---

## Common Mistakes

Mistake 1: Forgetting to resume.

```lua
local co = coroutine.create(function()
    print("never runs")
end)
-- forgot coroutine.resume(co)
```

Mistake 2: Resuming a dead coroutine.

```lua
coroutine.resume(co)     -- after it finished
-- returns false and an error message
```

Mistake 3: Trying to yield from the main thread.

```lua
coroutine.yield()     -- ERROR in main thread
```

You can only yield inside a coroutine.

Mistake 4: Using coroutine in Roblox when task is simpler.

Use `task.spawn`, `task.wait`, `task.delay`.

Mistake 5: Forgetting that resume returns success first.

```lua
local value = coroutine.resume(co)     -- value is true, not the yield
local ok, value = coroutine.resume(co) -- correct
```

---

## Summary

- A coroutine is code that can pause and resume
- Use `coroutine.create` to make one
- Use `coroutine.resume` to run it
- Use `coroutine.yield` to pause inside
- Use `coroutine.status` to check
- Use `coroutine.wrap` for a simpler API
- In Roblox, prefer the `task` library
