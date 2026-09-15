# if-else.lua

Basic conditionals in Lua.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Simplest If Statement

An if statement runs code only when a condition is true.

```
if true then
    print("This runs")
end
```

```
if false then
    print("This never runs")
end
```

---

## If with a Variable

```
local health = 75

if health > 0 then
    print("Player is alive")
end
```

Change `health` to `0` and run it again.
The message will not appear.

---

## If and Else

Use else to run code when the condition is false.

```
local health = 0

if health > 0 then
    print("Player is alive")
else
    print("Player is dead")
end
```

Only one of the two blocks runs.

---

## Comparing Numbers

```
local a = 10
local b = 20

if a < b then
    print("a is smaller")
end

if a > b then
    print("a is bigger")
else
    print("a is not bigger")
end

if a == 10 then
    print("a is exactly 10")
end

if a ~= 20 then
    print("a is not 20")
end
```

---

## Comparing Strings

Strings compare exactly.
Case matters.

```
local name = "Alex"

if name == "Alex" then
    print("Hello, Alex")
end

if name == "alex" then
    print("This does not run. Case matters.")
end

if name ~= "Bob" then
    print("You are not Bob")
end
```

---

## Comparing Booleans

```
local isAlive = true

if isAlive then
    print("Still alive")
end

if not isAlive then
    print("This does not run")
end
```

When the value is already a boolean, you do not need to compare it.
Just write `if isAlive then` instead of `if isAlive == true then`.

---

## Truthy and Falsy Values

In Lua, only two things are false:

- false
- nil

Everything else is true.
This includes `0` and `""`.

```
if 0 then
    print("0 is true in Lua")
end

if "" then
    print("Empty string is true in Lua")
end

if nil then
    print("This never runs")
end

if false then
    print("This never runs")
end
```

This surprises people from other languages.

---

## Real Game Examples

Check if a player can buy an item:

```
local coins = 100
local price = 75

if coins >= price then
    print("Purchase successful")
    coins = coins - price
else
    print("Not enough coins")
end

print("Coins left: " .. coins)
```

Check if a player can attack:

```
local health = 75
local cooldown = 0

if health > 0 and cooldown == 0 then
    print("Attack ready")
else
    print("Cannot attack")
end
```

Check if a player has a key:

```
local hasKey = true

if hasKey then
    print("Door opens")
else
    print("Door is locked")
end
```

---

## A Small Health Check

```
local health = 100
local maxHealth = 100

if health == maxHealth then
    print("Full health")
elseif health > 0 then
    print("Hurt")
else
    print("Dead")
end
```

Change `health` to `50` and run again.
Change it to `0` and run again.
See how the output changes.

---

## A Nested Example

You can put an if inside another if.

```
local health = 50
local hasPotion = true

if health < 100 then
    if hasPotion then
        print("You can heal")
    else
        print("Find a potion")
    end
end
```

Nesting works, but try to combine conditions with `and` when possible.

```
if health < 100 and hasPotion then
    print("You can heal")
end
```

---

## Common Mistakes

Mistake 1: Using `=` instead of `==`.

```
if health = 0 then      -- ERROR
if health == 0 then     -- OK
```

Mistake 2: Forgetting `then`.

```
if health > 0           -- ERROR
if health > 0 then      -- OK
```

Mistake 3: Forgetting `end`.

```
if health > 0 then
    print("alive")      -- ERROR, missing end
```

Mistake 4: Writing `else if` instead of `elseif`.

```
if a then
    -- code
else if b then          -- ERROR, two words
    -- code
end
```

Use `elseif` as one word.

Mistake 5: Comparing different types.

```
if "5" == 5 then        -- false, one is a string
```

---

## What You Learned

- If runs code when a condition is true
- Else runs when it is false
- Comparisons use ==, ~=, >, <, >=, <=
- Only `false` and `nil` are false in Lua
- `0` and `""` are true
- Every if needs an `end`
- Do not use `=` for comparison
