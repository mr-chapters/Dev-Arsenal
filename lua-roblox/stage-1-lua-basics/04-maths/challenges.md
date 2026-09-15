
# Challenge 04 - Math

This is your exercise for Lesson 04.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that does math with player stats.

The script must:

- Create at least four number variables
- Do at least five different math operations
- Use at least three functions from the math library
- Print the results with labels
- Include a bonus calculation using random

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
=== Combat Stats ===
Base damage: 20
Attack multiplier: 1.5
Defense: 5

Final damage: 25
Health remaining: 75
Health percent: 75
Rounded percent: 75

Min damage: 15
Max damage: 30
Random damage: 22
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- At least four number variables
- At least one addition
- At least one subtraction
- At least one multiplication
- At least one division
- At least one modulus (`%`) or power (`^`)
- At least three math library functions
- At least one `math.random` call

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

Calculate the area and perimeter of a rectangle.

```lua
local width = 10
local height = 5

-- area
-- perimeter
```

### Bonus 2

Convert seconds to minutes and seconds.

```lua
local totalSeconds = 185

-- minutes and seconds
```

Expected output: `3 minutes and 5 seconds`

### Bonus 3

Roll two dice and print the total.

```lua
local die1 = math.random(1, 6)
local die2 = math.random(1, 6)
```

### Bonus 4

Draw a health bar using `string.rep`.

```lua
local health = 75
local maxHealth = 100

-- print a bar like [=======---]
```

### Bonus 5

Calculate the distance between two points.

```lua
local x1, z1 = 0, 0
local x2, z2 = 3, 4

-- distance = math.sqrt((x2-x1)^2 + (z2-z1)^2)
```

Expected output: `5`

### Bonus 6

Roll a random number and print whether it is even or odd.

```lua
local n = math.random(1, 100)

-- use n % 2 to check
```

---

## Hints

Hint for basic math:

```lua
local sum = a + b
local difference = a - b
local product = a * b
local quotient = a / b
local remainder = a % b
```

Hint for the math library:

```lua
math.floor(3.7)
math.ceil(3.2)
math.abs(-5)
math.max(1, 5, 3)
math.min(1, 5, 3)
math.sqrt(16)
```

Hint for random:

```lua
math.random(1, 10)
math.random(1, 100)
```

Hint for a percent:

```lua
local percent = (current / max) * 100
```

Hint for a health bar:

```lua
local bars = math.floor(percent / 10)
local display = "[" .. string.rep("=", bars) .. string.rep("-", 10 - bars) .. "]"
print(display)
```

---

## Common Mistakes to Avoid

- Using `^` when you meant `*`
- Forgetting that division gives a decimal
- Dividing by zero
- Forgetting parentheses in formulas
- Forgetting to store results in variables
- Using `math.random` without a range
- Forgetting to run the script with F5

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- Basic arithmetic with variables
- Modulus and power operators
- math library functions
- Random numbers
- Percent calculations
- Building output with math results

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I used at least four number variables
- [ ] I used addition, subtraction, multiplication, and division
- [ ] I used at least three math library functions
- [ ] I used math.random
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [05 - Conditionals](../05-conditionals/README.md).

---

Next: [05 - Conditionals](../05-conditionals/README.md)
