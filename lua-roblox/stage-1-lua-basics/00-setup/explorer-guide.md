# Explorer Guide

The Explorer is the panel on the left side of Roblox Studio.

It shows everything in your game as a list.
Every object, every script, every part, every setting lives here.

You will use this panel every time you open Studio.
Learn it well.

---

## What the Explorer Looks Like

```text
Explorer
│
├── Workspace
│   ├── Baseplate
│   ├── SpawnLocation
│   └── Part
│
├── Players
│
├── Lighting
│
├── ReplicatedStorage
│
├── ServerScriptService
│
├── ServerStorage
│
├── StarterGui
│
├── StarterPack
│
├── StarterPlayer
│
└── SoundService
```

Each line is called an **Instance**.

Instances can contain other instances.
A Part can contain a Decal.
A Model can contain many Parts.
Workspace can contain everything in your 3D world.

---

## The Most Important Services

Here are the ones you will use most often.

| Service | What It Holds |
|---------|---------------|
| Workspace | All 3D objects: parts, models, terrain |
| Players | Everyone currently in the game |
| Lighting | Sun, sky, atmosphere, fog |
| ReplicatedStorage | Shared data between server and client |
| ServerScriptService | Server-only scripts |
| ServerStorage | Server-only data |
| StarterGui | UI that every player sees |
| StarterPack | Tools every player starts with |
| StarterPlayer | Player character settings |
| SoundService | Global sound settings |

You do not need to memorize all of these today.
You just need to know they exist.

---

## How to Use the Explorer

### Selecting an Object

Click any item in the Explorer.
It becomes selected.

The Properties panel on the right updates to show that object's settings.

### Expanding and Collapsing

Click the small triangle arrow next to an item.
It shows or hides the children inside.

### Renaming

Double-click the name of an item.
Type a new name and press Enter.

### Adding an Object

Right-click on any item.
Choose **Insert Object**.
Pick what you want to add.

Example: right-click Workspace, choose Insert Object, then Part.
A new Part appears.

### Deleting an Object

Select the object.
Press Delete on your keyboard.

Or right-click it and choose Delete.

### Moving an Object

Drag an item in the Explorer.
Drop it inside another item to make it a child.

Example: drag a Part into a Model to group them.

---

## The Parent and Child Idea

Everything in the Explorer has a relationship.

- A **parent** contains other things
- A **child** is contained inside something

Example:

```text
Workspace
└── Model
    ├── Part1
    └── Part2
```

Workspace is the parent of Model.
Model is the parent of Part1 and Part2.
Part1 and Part2 are children of Model.

You will hear these words constantly.
Parent means "container."
Child means "contained."

---

## Where Scripts Go

This is very important.

Different scripts go in different places.

| Script Type | Where It Goes | What It Does |
|-------------|---------------|--------------|
| Script | ServerScriptService | Server-side logic |
| LocalScript | StarterPlayerScripts | Client-side logic |
| Script | Inside a Part | Controls that Part |
| LocalScript | StarterGui | UI logic |
| ModuleScript | ReplicatedStorage | Reusable code |

If you put a script in the wrong place, it will not work.

Rule of thumb for beginners:
Put every Script in ServerScriptService unless the lesson tells you otherwise.

---

## How to Insert Your First Script

1. In the Explorer, click ServerScriptService
2. Right-click it
3. Choose Insert Object
4. Click Script
5. A new script appears with a default template

Now type this inside the script:

```lua
print("Hello from the Explorer")
```

Press F5 to play.
Look at the Output window (press F9 if you do not see it).

You should see "Hello from the Explorer" printed.

---

## Practice

Do these steps to get comfortable with the Explorer.

1. Open Roblox Studio
2. Create a new Baseplate place
3. In the Explorer, find Workspace
4. Right-click Workspace, choose Insert Object, then Part
5. Click the Part in the Explorer
6. In the Properties panel, change its Color
7. Rename it to "MyFirstPart"
8. Delete it
9. Insert another Part
10. Drag that Part into Workspace if it is not already there

Do these steps a few times until they feel natural.

---

## Common Mistakes

Mistake: Putting a Script inside Workspace instead of ServerScriptService.

Result: The script may still run, but it can be harder to manage.
For beginner lessons, always use ServerScriptService.

Mistake: Deleting Workspace by accident.

Result: Your whole game world disappears.
Press Ctrl+Z to undo.

Mistake: Forgetting to expand the arrow next to a service.

Result: You cannot see what is inside.
Click the small triangle arrow.

Mistake: Renaming something to a name already in use.

Result: Roblox will add a number to the end.
Example: renaming two parts to "Part" gives you "Part" and "Part1".

---

## Summary

- The Explorer shows everything in your game
- Each line is an Instance
- Instances have parents and children
- Scripts go in specific places
- Right-click to add or delete objects
- Double-click to rename

Now open Roblox Studio and try the practice steps.

---

Next: [properties-guide.md](properties-guide.md)
