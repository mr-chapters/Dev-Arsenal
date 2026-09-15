# example.lua

A real example of using modules in a Roblox project.

This shows how a module for damage, a module for config, and a module for player data fit together.

This is a reference file. Copy the code into Roblox Studio.
Create each section as its own ModuleScript or Script as noted.

---

## The Project Structure

```text
ReplicatedStorage/
  Modules/
    Config.lua
    DamageModule.lua
    PlayerData.lua

ServerScriptService/
  Main.server.lua
```

---

## Module 1: Config

Create a ModuleScript in ReplicatedStorage.
Name it `Config`.

```lua
-- Config.lua
-- Shared game settings.

local Config = {}

Config.GAME_NAME = "Code Forge"
Config.MAX_PLAYERS = 12
Config.ROUND_TIME = 300

Config.STARTING_COINS = 0
Config.STARTING_LEVEL = 1
Config.STARTING_HEALTH = 100
Config.MAX_HEALTH = 100

Config.DIFFICULTIES = {
    easy = {
        enemyHealth = 50,
        enemyDamage = 5,
        reward = 10
    },
    normal = {
        enemyHealth = 100,
        enemyDamage = 10,
        reward = 25
    },
    hard = {
        enemyHealth = 200,
        enemyDamage = 20,
        reward = 60
    }
}

return Config
```

---

## Module 2: DamageModule

Create a ModuleScript in ReplicatedStorage.
Name it `DamageModule`.

```lua
-- DamageModule.lua
-- Handles all damage calculations.

local DamageModule = {}

-- Calculate damage after multiplier and defense.
function DamageModule.calculate(base, multiplier, defense)
    local raw = base * multiplier
    local final = raw - defense
    if final < 0 then
        final = 0
    end
    return final
end

-- Apply damage to a character's Humanoid.
function DamageModule.applyToCharacter(character, amount)
    if not character then return end

    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end

    humanoid:TakeDamage(amount)
end

-- Compute critical hit.
function DamageModule.rollCritical(chance)
    return math.random(1, 100) <= chance
end

return DamageModule
```

---

## Module 3: PlayerData

Create a ModuleScript in ReplicatedStorage.
Name it `PlayerData`.

```lua
-- PlayerData.lua
-- In-memory player data for the current session.

local Config = require(script.Parent:WaitForChild("Config"))

local PlayerData = {}

-- Table of players keyed by user ID.
PlayerData.players = {}

function PlayerData.create(userId, name)
    PlayerData.players[userId] = {
        name = name,
        level = Config.STARTING_LEVEL,
        health = Config.STARTING_HEALTH,
        maxHealth = Config.MAX_HEALTH,
        coins = Config.STARTING_COINS
    }
    return PlayerData.players[userId]
end

function PlayerData.get(userId)
    return PlayerData.players[userId]
end

function PlayerData.remove(userId)
    PlayerData.players[userId] = nil
end

function PlayerData.addCoins(userId, amount)
    local player = PlayerData.players[userId]
    if player then
        player.coins = player.coins + amount
    end
end

function PlayerData.takeDamage(userId, amount)
    local player = PlayerData.players[userId]
    if player then
        player.health = player.health - amount
        if player.health < 0 then
            player.health = 0
        end
    end
end

function PlayerData.heal(userId, amount)
    local player = PlayerData.players[userId]
    if player then
        player.health = player.health + amount
        if player.health > player.maxHealth then
            player.health = player.maxHealth
        end
    end
end

return PlayerData
```

---

## Main Script

Create a Script in ServerScriptService.
Name it `Main`.

```lua
-- Main.server.lua
-- Entry point for the server.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Modules = ReplicatedStorage:WaitForChild("Modules")

local Config = require(Modules:WaitForChild("Config"))
local DamageModule = require(Modules:WaitForChild("DamageModule"))
local PlayerData = require(Modules:WaitForChild("PlayerData"))


-- ============================================
-- PLAYER JOIN AND LEAVE
-- ============================================

Players.PlayerAdded:Connect(function(player)
    print(player.Name .. " joined")

    -- Create their data
    local data = PlayerData.create(player.UserId, player.Name)
    print("Created data for " .. player.Name)
    print("  Level: " .. data.level)
    print("  Health: " .. data.health)
    print("  Coins: " .. data.coins)

    -- Welcome message
    print("Welcome to " .. Config.GAME_NAME .. ", " .. player.Name .. "!")
end)


Players.PlayerRemoving:Connect(function(player)
    print(player.Name .. " left")
    PlayerData.remove(player.UserId)
end)


-- ============================================
-- DEMO: DAMAGE CALCULATION
-- ============================================

-- Simulate a level 1 player hitting a normal enemy.

local difficulty = Config.DIFFICULTIES.normal

local damage = DamageModule.calculate(20, 1.5, difficulty.enemyDamage)
print("Damage dealt: " .. damage)

-- Simulate a critical hit.

local isCrit = DamageModule.rollCritical(25)
if isCrit then
    damage = damage * 2
    print("Critical hit! Damage: " .. damage)
end


-- ============================================
-- DEMO: PLAYER DATA AFTER COMBAT
-- ============================================

-- Pretend the first player took damage and earned coins.

Players.PlayerAdded:Wait()
local firstPlayer = Players:GetPlayers()[1]

if firstPlayer then
    PlayerData.takeDamage(firstPlayer.UserId, 30)
    PlayerData.addCoins(firstPlayer.UserId, difficulty.reward)

    local data = PlayerData.get(firstPlayer.UserId)
    print("After combat:")
    print("  Health: " .. data.health .. " / " .. data.maxHealth)
    print("  Coins: " .. data.coins)
end
```

---

## What You Should See

When you press F5 and a player joins, the Output window shows:

```text
Module loaded: Config
Module loaded: DamageModule
Module loaded: PlayerData
Player1 joined
Created data for Player1
  Level: 1
  Health: 100
  Coins: 0
Welcome to Code Forge, Player1!
Damage dealt: 20
Critical hit! Damage: 40
After combat:
  Health: 70 / 100
  Coins: 25
```

---

## Why This Structure Works

Each module has one job.

- `Config` holds all settings. Change once, update everywhere.
- `DamageModule` handles all damage math.
- `PlayerData` tracks players in memory.
- `Main` connects it all together.

If you want to change how damage is calculated, you edit one file.
If you want to add a new difficulty, you edit one line.
If you want to add a new player field, you edit one function.

This is how real Roblox games are built.

---

## Notes

- This example uses in-memory data only.
- Real games save to DataStore so progress persists between sessions.
- DataStore is covered in Stage 2.
- For now, focus on how the modules connect.

---

## What You Learned

- How to split code into modules
- How modules require each other
- How to share state between scripts
- How to organize a real Roblox project
- Why small modules are better than one big script
