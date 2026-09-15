# logic-ops.lua

Logical operators in Lua.

The three logical operators are `and`, `or`, and `not`.
They let you combine conditions and check more complex situations.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Three Operators

| Operator | Meaning |
|----------|---------|
| and | both sides must be true |
| or | at least one side must be true |
| not | flips true to false, false to true |

---

## The and Operator

Both sides must be true for the whole thing to be true.

```
print(true and true)      -- true
print(true and false)     -- false
print(false and true)     -- false
print(false and false)    -- false
```

Real game example:

```
local health = 50
local hasShield = true

if health > 0 and hasShield then
    print("Protected")
end
```

The message prints only when both are true.

---

## The or Operator

At least one side must be true for the whole thing to be true.

```
print(true or true)       -- true
print(true or false)      -- true
print(false or true)      -- true
print(false or false)     -- false
```

Real game example:

```
local isAdmin = false
local isModerator = true

if isAdmin or isModerator then
    print("You have powers")
end
```

The message prints because at least one is true.

---

## The not Operator

Flips the value.

```
print(not true)           -- false
print(not false)          -- true
print(not nil)            -- true
```

Real game example:

```
local isDead = false

if not isDead then
    print("Still alive")
end
```

`not isDead` means "not dead", so the message prints.

---

## Combining Operators

You can combine them.

```
local health = 50
local maxHealth = 100
local hasShield = true

if health > 0 and health < maxHealth and hasShield then
    print("Hurt but protected")
end
```

When multiple and operators are used, all must be true.

You can mix and and or:

```
local isAdmin = false
local isModerator = true
local isOwner = false

if isAdmin or isModerator or isOwner then
    print("Has some power")
end
```

You can use not with the other operators:

```
local health = 50
local isDead = false

if health > 0 and not isDead then
    print("Alive")
end
```

---

## Order of Operations

Lua evaluates `not` first, then `and`, then `or`.

```
print(true or false and false)
```

This is evaluated as:

```
true or (false and false)
true or false
true
```

If you want a different order, use parentheses.

```
print((true or false) and false)
```

This is evaluated as:

```
(true or false) and false
true and false
false
```

When in doubt, use parentheses.

---

## Truth Tables

### and

| A | B | A and B |
|---|---|---------|
| true | true | true |
| true | false | false |
| false | true | false |
| false | false | false |

### or

| A | B | A or B |
|---|---|--------|
| true | true | true |
| true | false | true |
| false | true | true |
| false | false | false |

### not

| A | not A |
|---|-------|
| true | false |
| false | true |

---

## Real Game Examples

### Can the player enter the dungeon

```
local level = 15
local hasKey = true
local isAlive = true

if level >= 10 and hasKey and isAlive then
    print("Enter the dungeon")
else
    print("Cannot enter")
end
```

### Can the player buy a discount

```
local isMember = false
local hasCoupon = true

if isMember or hasCoupon then
    print("Discount applied")
else
    print("Full price")
end
```

### Is the enemy vulnerable

```
local isStunned = true
local hasShield = false

if not hasShield then
    print("Enemy can be hit")
end

if isStunned and not hasShield then
    print("Enemy is fully vulnerable")
end
```

---

## Short Circuit Evaluation

Lua stops checking as soon as the result is known.

With `and`, if the first value is false, Lua does not check the second.

```
local result = false and error("never runs")
print(result)     -- false
```

With `or`, if the first value is true, Lua does not check the second.

```
local result = true or error("never runs")
print(result)     -- true
```

This is useful. You can use it for safety checks.

```
local player = getPlayer()
if player and player.health > 0 then
    print("Player is alive")
end
```

If `player` is nil, `player.health` is never accessed.
No error.

---

## Using `or` for Default Values

A common Lua pattern:

```
local name = nil
local displayName = name or "Guest"

print(displayName)     -- Guest
```

If `name` is nil, `displayName` becomes "Guest".

```
local name = "Alex"
local displayName = name or "Guest"

print(displayName)     -- Alex
```

If `name` has a value, that value is used.

This pattern is used constantly in Roblox code.

---

## The `and` Operator for Conditional Values

```
local isPremium = true
local bonus = isPremium and 100 or 0

print(bonus)     -- 100
```

This reads as: if `isPremium` is true, use 100, else use 0.

It is a compact if statement.

---

## Complex Condition

```
local health = 50
local maxHealth = 100
local hasShield = true
local hasPotion = false
local isDead = false

local canFight = health > 0 and not isDead
local canHeal = health < maxHealth and hasPotion
local isProtected = hasShield or health > maxHealth * 0.75

print("Can fight:", canFight)         -- true
print("Can heal:", canHeal)           -- false
print("Is protected:", isProtected)   -- true
```

You can store the result of a condition in a variable.
This makes complex logic easier to read.

---

## Common Mistakes

Mistake 1: Using `&&` and `||` from other languages.

```
if a && b then        -- ERROR
if a and b then       -- OK
```

Lua uses words, not symbols.

Mistake 2: Using `!` for not.

```
if !isDead then       -- ERROR
if not isDead then    -- OK
```

Mistake 3: Wrong order without parentheses.

```
if a or b and c then          -- ambiguous
if a or (b and c) then        -- clear
```

Mistake 4: Forgetting that `0` is true.

```
if 0 then
    print("This prints")
end
```

In Lua, only false and nil are false.

Mistake 5: Using `not` on a value expecting a number.

```
local n = 5
if not n then         -- false, n is a value
```

`not` always returns a boolean.

---

## What You Learned

- `and` needs both sides true
- `or` needs at least one side true
- `not` flips the value
- Lua evaluates `not`, then `and`, then `or`
- Use parentheses to control the order
- Short circuit evaluation saves work
- Use `or` for default values
- `0` and `""` are true in Lua
