# Challenge 06 - Loops

This is your exercise for Lesson 06.

Do not look at the solution until you have tried it yourself.
The point is to build the habit of solving problems on your own.

---

## The Goal

Write a script that uses all three types of loops to solve simple problems.

The script must:

- Use a for loop to count
- Use a while loop to repeat until a condition
- Use a repeat loop that runs at least once
- Use `break` to stop a loop early
- Use a nested loop

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
=== Count to 5 ===
1
2
3
4
5

=== Countdown ===
5
4
3
2
1
Go!

=== While loop ===
n = 0
n = 1
n = 2
n = 3
n = 4

=== Repeat loop ===
Running once
Running twice
Done

=== Break at 3 ===
1
2

=== Nested loop ===
1 1
1 2
2 1
2 2
3 1
3 2
```

Your values will be different. That is fine.
The structure is what matters.

---

## Requirements

Your script must include:

- One for loop that counts up
- One for loop that counts down
- One while loop
- One repeat loop
- One loop that uses `break`
- One nested loop
- At least six print statements

---

## Bonus Challenges

If you finish the basic challenge, try these.

### Bonus 1

FizzBuzz from 1 to 20.

Rules:

- If divisible by 3, print "Fizz"
- If divisible by 5, print "Buzz"
- If divisible by both, print "FizzBuzz"
- Otherwise print the number

```lua
for i = 1, 20 do
    -- your code here
end
```

### Bonus 2

Sum the numbers from 1 to 100.

```lua
local sum = 0
-- your loop here
print("Sum:", sum)
```

Expected output: `5050`

### Bonus 3

Countdown timer.

```lua
local seconds = 5

while seconds > 0 do
    -- print seconds
    -- wait one second
    -- subtract one
end

print("Go!")
```

### Bonus 4

Print a triangle of stars.

Expected output:

```text
*
**
***
****
*****
```

Hint: use nested loops or `string.rep`.

### Bonus 5

Loop through a table and print each item.

```lua
local colors = {"red", "green", "blue", "yellow"}

for i, color in ipairs(colors) do
    print(i, color)
end
```

### Bonus 6

Find the largest number in a table.

```lua
local numbers = {3, 7, 2, 9, 4, 1, 8}
local largest = numbers[1]

for _, n in ipairs(numbers) do
    -- if n > largest then largest = n
end

print("Largest:", largest)
```

Expected output: `9`

---

## Hints

Hint for a for loop:

```lua
for i = 1, 5 do
    print(i)
end
```

Hint for counting down:

```lua
for i = 5, 1, -1 do
    print(i)
end
```

Hint for a while loop:

```lua
local n = 0
while n < 5 do
    print(n)
    n = n + 1
end
```

Hint for a repeat loop:

```lua
local n = 0
repeat
    print(n)
    n = n + 1
until n >= 5
```

Hint for break:

```lua
for i = 1, 10 do
    if i == 5 then break end
    print(i)
end
```

Hint for a nested loop:

```lua
for i = 1, 3 do
    for j = 1, 3 do
        print(i, j)
    end
end
```

Hint for a sum:

```lua
local sum = 0
for i = 1, 100 do
    sum = sum + i
end
print(sum)
```

Hint for checking divisibility:

```lua
if i % 3 == 0 then
    print("Fizz")
end
```

---

## Common Mistakes to Avoid

- Forgetting to update the counter in a while loop
- Using `=` instead of `==` in the while condition
- Forgetting `do` at the start of a for or while loop
- Forgetting `until` at the end of a repeat loop
- Forgetting `end` at the end of a loop
- Using the wrong variable name inside the loop
- Writing an infinite loop that freezes Roblox
- Forgetting to press F5 to run the script

---

## Solution

Only open the solution after you have tried the challenge yourself.

The solution is here: [solution.md](solution.md)

If you have not written your own code yet, go back and do it now.
Struggling is part of learning.

---

## What You Practiced

- For loops counting up and down
- While loops checking conditions
- Repeat loops that run at least once
- Breaking out of loops early
- Nested loops
- Looping through tables

---

## Checklist

- [ ] I wrote my own script without copying from the lesson
- [ ] The script runs without errors
- [ ] I used a for loop
- [ ] I used a while loop
- [ ] I used a repeat loop
- [ ] I used break at least once
- [ ] I used a nested loop
- [ ] I tried at least one bonus challenge
- [ ] I understood any errors I saw

When all boxes are checked, move to [07 - Functions](../07-functions/README.md).

---

Next: [07 - Functions](../07-functions/README.md)
