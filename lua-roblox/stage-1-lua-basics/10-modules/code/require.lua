
# require.lua

Requiring a ModuleScript in Roblox.

Require is how you load a module from another script.

This is a reference file. Copy the code into a Script inside Roblox Studio.
Put the Script in ServerScriptService.

---

## The Basic Pattern

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))
```

The first line gets the service that holds the module.
The second line requires the module and stores it in `Utils`.

---

## What require Does

`require` does three things:

1. Finds the ModuleScript
2. Runs the code inside it once
3. Returns whatever the module returned

After the first require, the module is cached.
Every future require returns the same table.

---

## Requiring from Different Locations

From ReplicatedStorage:

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))
```

From ServerStorage:

```lua
local ServerStorage = game:GetService("ServerStorage")
local DataModule = require(ServerStorage:WaitForChild("DataModule"))
```

From ServerScriptService:

```lua
local ServerScriptService = game:GetService("ServerScriptService")
local Combat = require(ServerScriptService:WaitForChild("Combat"))
```

From a sibling folder:

```lua
local Utils = require(script.Parent:WaitForChild("Utils"))
```

From a parent folder:

```lua
local Utils = require(script.Parent.Parent:WaitForChild("Utils"))
```

---

## Why WaitForChild

`WaitForChild` pauses until the object exists.

Without it:

```lua
local Utils = require(ReplicatedStorage.Utils)     -- may error
```

If `Utils` has not loaded yet, this errors.
With `WaitForChild`, the script waits.

Always use `WaitForChild` when requiring.

---

## Requiring Only ModuleScripts

Only ModuleScripts can be required.

```lua
require(script)               -- ERROR if script is a Script
require(workspace)            -- ERROR, workspace is not a module
require(ReplicatedStorage)    -- ERROR, service is not a module
```

This works:

```lua
require(ReplicatedStorage:WaitForChild("Utils"))     -- OK
```

---

## Storing the Result

Store the module in a variable.

```lua
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))

print(Utils.add(2, 3))
print(Utils.multiply(4, 5))
```

The variable name usually matches the module name.

---

## Sharing Between Scripts

Every script that requires the same module gets the same table.

```lua
-- ScriptA.server.lua
local Counter = require(ReplicatedStorage:WaitForChild("Counter"))
Counter.increment()
print("ScriptA:", Counter.value)
```

```lua
-- ScriptB.server.lua
local Counter = require(ReplicatedStorage:WaitForChild("Counter"))
Counter.increment()
print("ScriptB:", Counter.value)
```

If both scripts run, the shared counter goes to 2.
They are using the same table.

---

## A Module That Depends on Another

```lua
-- DamageModule.lua
local Config = require(script.Parent:WaitForChild("Config"))

local DamageModule = {}

function DamageModule.calculate(base, multiplier)
    local result = base * multiplier
    if result > Config.MAX_DAMAGE then
        result = Config.MAX_DAMAGE
    end
    return result
end

return DamageModule
```

The module requires its dependency at the top.
Both must be in the same folder.

---

## Folder Structure for Requires

```text
ReplicatedStorage/
  Modules/
    Config.lua
    Utils.lua
    DamageModule.lua
```

`DamageModule` requires `Config` like this:

```lua
local Config = require(script.Parent:WaitForChild("Config"))
```

`script` is the DamageModule.
`script.Parent` is the Modules folder.
`WaitForChild("Config")` gets the sibling module.

---

## Requiring Many Modules

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules")

local Config = require(Modules:WaitForChild("Config"))
local Utils = require(Modules:WaitForChild("Utils"))
local Damage = require(Modules:WaitForChild("DamageModule"))
local PlayerData = require(Modules:WaitForChild("PlayerData"))
```

Get the folder once, then require each module from it.
This keeps the script short.

---

## Do Not Use require in a Loop

Every require is cached, but you should still only require once.

```lua
-- Bad
for i = 1, 10 do
    local Utils = require(ReplicatedStorage:WaitForChild("Utils"))
    Utils.doSomething()
end
```

```lua
-- Good
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))

for i = 1, 10 do
    Utils.doSomething()
end
```

Require once at the top of the script.

---

## Requiring on the Client

On the client, require only from ReplicatedStorage.

```lua
-- LocalScript
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))
```

The client cannot access ServerStorage or ServerScriptService.
Those require lines will error.

---

## Requiring on the Server

On the server, you can require from ReplicatedStorage, ServerStorage, or ServerScriptService.

```lua
-- Script (server)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Config = require(ReplicatedStorage:WaitForChild("Config"))
local Data = require(ServerStorage:WaitForChild("Data"))
```

The server has access to everything.

---

## A Real Example

The `Main` script requires three modules.

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules")

local Config = require(Modules:WaitForChild("Config"))
local DamageModule = require(Modules:WaitForChild("DamageModule"))
local PlayerData = require(Modules:WaitForChild("PlayerData"))

print("Game: " .. Config.GAME_NAME)

local dmg = DamageModule.calculate(20, 1.5, 5)
print("Damage: " .. dmg)

local data = PlayerData.create(1, "Alex")
print("Player created: " .. data.name)
```

Output:

```text
Game: Code Forge
Damage: 25
Player created: Alex
```

---

## Errors You Might See

`Infinite yield possible on ...`

The module does not exist in that folder.
Check the name and location.

`attempt to call a nil value`

You tried to call something that is not there.
The module may have failed to load, or you misspelled the function name.

`Unable to cast value to Object`

You passed the wrong thing to require.
It needs a ModuleScript instance, not a string.

`Requested module was required recursively`

Module A requires Module B, which requires Module A.
Break the loop by removing one dependency.

---

## Checking That a Module Loaded

Add a print inside the module.

```lua
print("Utils module loaded")

local Utils = {}

function Utils.add(a, b)
    return a + b
end

return Utils
```

If you see it once, the module loaded.
If you see it twice, you may have created two copies of the module.

---

## Common Mistakes

Mistake 1: Forgetting WaitForChild.

```lua
local Utils = require(ReplicatedStorage.Utils)     -- risky
local Utils = require(ReplicatedStorage:WaitForChild("Utils"))     -- safe
```

Mistake 2: Requiring the same module every frame.

Cache it in a local at the top of the script.

Mistake 3: Requiring from the client something in ServerStorage.

The client cannot see ServerStorage.

Mistake 4: Requiring a Script instead of a ModuleScript.

Only ModuleScripts can be required.

Mistake 5: Forgetting to return from the module.

If the module returns nothing, `require` gives nil.

Mistake 6: Requiring something that does not exist yet.

Use `WaitForChild`.

---

## Summary

- `require` loads a ModuleScript
- The module runs once, then is cached
- The result is the value the module returned
- Always use `WaitForChild`
- Require once at the top of the script
- Store the result in a local
- The server can require from anywhere
- The client can only require from ReplicatedStorage
- Only ModuleScripts can be required
