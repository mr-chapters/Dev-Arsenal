# elseif.lua

Multiple conditions in Lua.

When one condition is not enough, use elseif to check more.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService, then press F5 to play.

---

## The Pattern

```
if condition1 then
    -- runs when condition1 is true
elseif condition2 then
    -- runs when condition2 is true
elseif condition3 then
    -- runs when condition3 is true
else
    -- runs when none are true
end
```

Lua checks each condition in order.
The first true one wins.
Everything after is skipped.

The else at the end is optional.

---

## A Simple Example

```
local score = 75

if score >= 90 then
    print("Grade A")
elseif score >= 80 then
    print("Grade B")
elseif score >= 70 then
    print("Grade C")
else
    print("Grade F")
end
```

Run it with different scores.
Change `score` to `95`, `82`, `71`, `40`.
See how the output changes each time.

---

## How the Order Matters

Lua stops at the first true condition.

```
local score = 95

if score >= 70 then
    print("Pass")
elseif score >= 90 then
    print("Grade A")
end
```

This prints "Pass" even though the score is 95.
Because the first condition `score >= 70` is already true.

Always put the most specific conditions first.

```
local score = 95

if score >= 90 then
    print("Grade A")
elseif score >= 70 then
    print("Pass")
end
```

Now it prints "Grade A".

---

## Player Rank Example

```
local level = 25

if level >= 100 then
    print("Legend")
elseif level >= 50 then
    print("Veteran")
elseif level >= 25 then
    print("Experienced")
elseif level >= 10 then
    print("Intermediate")
else
    print("Beginner")
end
```

Run it with different levels.
Change `level` to `5`, `12`, `30`, `75`, `150`.

---

## Enemy Difficulty Example

```
local playerLevel = 10

if playerLevel < 5 then
    print("Easy enemies")
elseif playerLevel < 15 then
    print("Normal enemies")
elseif playerLevel < 30 then
    print("Hard enemies")
else
    print("Boss enemies")
end
```

The `<` operator checks "less than".
The order still matters.

---

## Health Status Example

```
local health = 75
local maxHealth = 100

if health <= 0 then
    print("Dead")
elseif health < maxHealth * 0.25 then
    print("Critical")
elseif health < maxHealth * 0.5 then
    print("Low")
elseif health < maxHealth then
    print("Hurt")
else
    print("Full health")
end
```

Notice `maxHealth * 0.25` inside the condition.
You can put math inside comparisons.

---

## Combining Conditions in elseif

Each elseif can have its own combination of and, or, not.

```
local health = 75
local hasShield = true
local hasPotion = false

if health <= 0 then
    print("Dead")
elseif health < 50 and hasShield then
    print("Low but protected")
elseif health < 50 and hasPotion then
    print("Low but can heal")
elseif health < 50 then
    print("Low and in danger")
else
    print("Healthy")
end
```

---

## Time of Day Example

```
local hour = 14

if hour < 6 then
    print("Night")
elseif hour < 12 then
    print("Morning")
elseif hour < 18 then
    print("Afternoon")
else
    print("Evening")
end
```

Change `hour` to different values to test.

---

## Grade Calculator

```
local function getGrade(score)
    if score >= 90 then
        return "A"
    elseif score >= 80 then
        return "B"
    elseif score >= 70 then
        return "C"
    elseif score >= 60 then
        return "D"
    else
        return "F"
    end
end

print(getGrade(95))
print(getGrade(85))
print(getGrade(75))
print(getGrade(65))
print(getGrade(50))
```

This is a function.
Functions are covered in Lesson 07.
For now, just notice that the elseif chain is inside the function.

---

## Nested if Inside elseif

You can nest ifs inside elseif blocks.

```
local item = "potion"
local coins = 30

if item == "sword" then
    if coins >= 100 then
        print("Buy sword")
    else
        print("Sword too expensive")
    end
elseif item == "potion" then
    if coins >= 20 then
        print("Buy potion")
    else
        print("Potion too expensive")
    end
else
    print("Unknown item")
end
```

Nesting works but can get messy.
Try to keep it simple.

---

## Common Mistakes

Mistake 1: Writing `else if` instead of `elseif`.

```
else if score >= 80 then    -- ERROR, two words
elseif score >= 80 then     -- OK
```

Mistake 2: Forgetting the final end.

```
if a then
elseif b then
-- missing end
```

Every if block needs one `end` at the very bottom.

Mistake 3: Wrong order of conditions.

```
if score >= 70 then
    print("Pass")
elseif score >= 90 then
    print("A")
end
```

The 90 condition never runs.
Always put the strictest condition first.

Mistake 4: Comparing different types.

```
if "5" >= 5 then    -- false, one is a string
```

Mistake 5: Forgetting `then` after `elseif`.

```
elseif score >= 80      -- ERROR
elseif score >= 80 then -- OK
```

---

## What You Learned

- elseif checks more conditions after the first if
- Lua stops at the first true condition
- Order matters. Put strict conditions first
- Each elseif has its own condition
- The else at the end is optional
- You can combine and, or, not inside any condition
- Every if block needs one end at the bottom
