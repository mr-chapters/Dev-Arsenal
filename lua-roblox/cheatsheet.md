
# Lua and Roblox Cheatsheet

Quick reference for everything you will use while learning Roblox game development.

Keep this file open in a second tab while you code.

---

## Comments

```lua
-- This is a single line comment

--[[
   This is a
   multi line comment
]]
```

---

## Variables

```lua
local name = "Alex"        -- string
local age = 25             -- number
local isAlive = true       -- boolean
local nothing = nil        -- nil

local count = 0            -- you can change this
count = count + 1
```

Rules:

- Always use `local` unless you have a reason not to
- Variable names cannot start with a number
- Variable names are case sensitive

---

## Data Types

| Type | Example | Notes |
|------|---------|-------|
| string | `"hello"` | Text |
| number | `42`, `3.14` | No separate int and float |
| boolean | `true`, `false` | |
| nil | `nil` | Means "no value" |
| table | `{1, 2, 3}` | Lists and dictionaries |
| function | `function() end` | Reusable code |
| thread | `coroutine.create()` | Runs separately |

---

## Strings

```lua
local a = "Hello"
local b = "World"

local c = a .. " " .. b           -- "Hello World"
local d = string.format("%s is %d", a, 10)
local e = #a                       -- length = 5
local f = a:upper()                -- "HELLO"
local g = a:lower()                -- "hello"
local h = a:sub(1, 3)              -- "Hel"
local i = a:find("ell")            -- 2, 4
local j = a:gsub("l", "L")         -- "HeLLo"
```

---

## Math

```lua
local a = 10 + 5       -- 15
local b = 10 - 5       -- 5
local c = 10 * 5       -- 50
local d = 10 / 5       -- 2
local e = 10 % 3       -- 1  (remainder)
local f = 10 ^ 2       -- 100 (power)

math.random()          -- 0 to 1
math.random(1, 10)     -- 1 to 10
math.floor(3.7)        -- 3
math.ceil(3.2)         -- 4
math.abs(-5)           -- 5
math.max(1, 5, 3)      -- 5
math.min(1, 5, 3)      -- 1
math.sqrt(16)          -- 4
```

---

## Conditionals

```lua
if x > 10 then
    print("big")
elseif x > 5 then
    print("medium")
else
    print("small")
end
```

Operators:

| Operator | Meaning |
|----------|---------|
| `==` | equal |
| `~=` | not equal |
| `>` | greater |
| `<` | less |
| `>=` | greater or equal |
| `<=` | less or equal |
| `and` | both true |
| `or` | either true |
| `not` | opposite |

---

## Loops

```lua
-- Numeric for
for i = 1, 5 do
    print(i)         -- 1 2 3 4 5
end

-- With step
for i = 10, 1, -1 do
    print(i)         -- 10 9 8 ... 1
end

-- While
local n = 0
while n < 5 do
    n = n + 1
end

-- Repeat
local m = 0
repeat
    m = m + 1
until m >= 5

-- Break
for i = 1, 10 do
    if i == 5 then break end
    print(i)
end
```

---

## Functions

```lua
local function greet(name)
    print("Hello, " .. name)
end

greet("Alex")

-- Return value
local function add(a, b)
    return a + b
end

local sum = add(2, 3)     -- 5

-- Multiple returns
local function two()
    return 1, 2
end

local x, y = two()        -- x = 1, y = 2

-- Default arguments
local function say(msg)
    msg = msg or "default"
    print(msg)
end
```

---

## Tables

```lua
-- Array
local fruits = {"apple", "banana", "cherry"}
print(fruits[1])           -- "apple"
print(#fruits)             -- 3

table.insert(fruits, "mango")
table.remove(fruits, 1)

-- Dictionary
local player = {
    name = "Alex",
    health = 100,
    level = 5
}

print(player.name)         -- "Alex"
player.health = 90

-- Loop over array
for i, v in ipairs(fruits) do
    print(i, v)
end

-- Loop over dictionary
for k, v in pairs(player) do
    print(k, v)
end
```

---

## Metatables (OOP)

```lua
local Animal = {}
Animal.__index = Animal

function Animal.new(name)
    local self = setmetatable({}, Animal)
    self.name = name
    return self
end

function Animal:speak()
    print(self.name .. " makes a sound")
end

local cat = Animal.new("Cat")
cat:speak()
```

---

## Modules

```lua
-- ModuleScript file: Utils.lua
local Utils = {}

function Utils.add(a, b)
    return a + b
end

return Utils
```

```lua
-- In another script
local Utils = require(game.ReplicatedStorage.Utils)
print(Utils.add(2, 3))
```

---

## Coroutines

```lua
local co = coroutine.create(function()
    print("start")
    coroutine.yield()
    print("resume")
end)

coroutine.resume(co)       -- prints "start"
coroutine.resume(co)       -- prints "resume"

-- Simpler version
task.spawn(function()
    print("runs async")
end)

task.wait(1)               -- wait 1 second
task.delay(2, function()
    print("runs after 2 seconds")
end)
```

---

## Roblox Services

```lua
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local DataStoreService = game:GetService("DataStoreService")
```

---

## Parts and Properties

```lua
local part = Instance.new("Part")
part.Size = Vector3.new(4, 1, 2)
part.Position = Vector3.new(0, 5, 0)
part.Color = Color3.fromRGB(255, 0, 0)
part.Material = Enum.Material.Neon
part.Anchored = true
part.CanCollide = false
part.Transparency = 0.5
part.Name = "MyPart"
part.Parent = workspace
```

---

## Vector3 and CFrame

```lua
local pos = Vector3.new(10, 5, 3)

local cf = CFrame.new(0, 5, 0)
local cf2 = CFrame.new(0, 5, 0) * CFrame.Angles(0, math.rad(90), 0)

part.CFrame = cf
part.Position = pos
```

---

## Events

```lua
part.Touched:Connect(function(hit)
    print(hit.Name .. " touched the part")
end)

button.MouseButton1Click:Connect(function()
    print("clicked")
end)

Players.PlayerAdded:Connect(function(player)
    print(player.Name .. " joined")
end)

Players.PlayerRemoving:Connect(function(player)
    print(player.Name .. " left")
end)

part:GetPropertyChangedSignal("Position"):Connect(function()
    print("moved")
end)
```

---

## Remote Events

```lua
-- Server: create the remote
local remote = Instance.new("RemoteEvent")
remote.Name = "MyRemote"
remote.Parent = ReplicatedStorage

remote.OnServerEvent:Connect(function(player, data)
    print(player.Name .. " sent: " .. data)
end)

-- Client: fire it
local remote = ReplicatedStorage:WaitForChild("MyRemote")
remote:FireServer("hello")
```

---

## GUI Basics

```lua
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 1, 0)
button.Text = "Click Me"
button.Parent = frame

button.MouseButton1Click:Connect(function()
    print("clicked")
end)
```

---

## DataStore

```lua
local DataStoreService = game:GetService("DataStoreService")
local store = DataStoreService:GetDataStore("PlayerData")

-- Save
local function save(player)
    local key = "player_" .. player.UserId
    store:SetAsync(key, {coins = 100, level = 5})
end

-- Load
local function load(player)
    local key = "player_" .. player.UserId
    local data = store:GetAsync(key)
    if data then
        print(data.coins, data.level)
    end
end
```

---

## Common Patterns

Wait for a child:

```lua
local part = workspace:WaitForChild("MyPart")
```

Find a player by character:

```lua
local player = Players:GetPlayerFromCharacter(hit.Parent)
```

Loop over all players:

```lua
for _, player in ipairs(Players:GetPlayers()) do
    print(player.Name)
end
```

Tween a part:

```lua
local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(1, Enum.EasingStyle.Quad)
local goal = {Position = Vector3.new(0, 20, 0)}
local tween = TweenService:Create(part, info, goal)
tween:Play()
```

---

## Debugging

```lua
print("value is", x)
warn("something might be wrong")
error("this stops the script")
```

Open the Output window in Roblox Studio to see all prints and errors.

---

## Script Locations

| Script Type | Where It Goes |
|-------------|---------------|
| Script | ServerScriptService |
| LocalScript | StarterPlayerScripts |
| Script | Inside a Part |
| LocalScript | StarterGui |
| ModuleScript | ReplicatedStorage |

---

## Useful Shortcuts in Studio

| Shortcut | Action |
|----------|--------|
| F5 | Play |
| F8 | Stop |
| F9 | Output window |
| Ctrl + Z | Undo |
| Ctrl + S | Save |
| F | Focus on selected part |

---

## Notes

- Print often. It is the fastest way to understand what your code is doing.
- If something does not work, check the Output window first.
- Copy this file to your own repo and add your own notes as you learn.
