# Properties Guide

The Properties panel is on the right side of Roblox Studio.

It shows every setting of the object you have selected in the Explorer or in the 3D view.

If the Explorer is how you find things, the Properties panel is how you change them.

---

## What the Properties Panel Looks Like

When you select a Part, the Properties panel shows something like this:

```text
Properties
│
├── Appearance
│   ├── Color            [Gray]
│   ├── Material         [Plastic]
│   ├── Transparency     0
│   ├── Reflectance      0
│   └── CastShadow       true
│
├── Data
│   ├── Name             Part
│   └── ClassName        Part
│
├── Behavior
│   ├── Anchored         false
│   ├── CanCollide       true
│   └── Locked           false
│
└── Transform
    ├── Position         0, 5, 0
    ├── Size             4, 1, 2
    ├── Rotation         0, 0, 0
    └── Orientation      0, 0, 0
```

Every property is a setting you can change.
Some are numbers. Some are true or false. Some are colors.
Some have a dropdown menu.

---

## How to Change a Property

1. Select an object in the Explorer or in the 3D view
2. Find the property in the Properties panel
3. Click on its value
4. Type a new value or pick from the dropdown
5. Press Enter

The change happens immediately.
You can see the result in the 3D view right away.

---

## The Most Important Properties for Beginners

These are the ones you will use constantly.

### Name

What the object is called in the Explorer.

Change it to something meaningful.
`Part` tells you nothing. `RedButton` or `KillBrick` tells you everything.

### Position

Where the object is in the world.

Written as three numbers: X, Y, Z.

- X is left and right
- Y is up and down
- Z is forward and back

Example: `0, 5, 0` means the object is 5 studs above the ground.

### Size

How big the object is.

Also written as three numbers: width, height, depth.

Example: `4, 1, 2` means 4 studs wide, 1 stud tall, 2 studs deep.

### Color

The color of the object.

Click the color swatch to open a color picker.
You can pick from the palette or type exact RGB values.

### Material

What the object looks like.

Common options:

- Plastic
- SmoothPlastic
- Neon
- Metal
- Wood
- Concrete
- Glass
- ForceField

Different materials look different and some glow.

### Transparency

How see-through the object is.

- 0 means fully solid
- 1 means fully invisible
- 0.5 means half see-through

This is a number between 0 and 1.

### Anchored

If true, the object does not move.

If false, gravity pulls it down and physics can push it around.

For building, set Anchored to true.
For physics objects, set it to false.

### CanCollide

If true, players and other parts bump into it.

If false, players and parts pass through it.

Turn this off for decorations that should not block movement.

### CastShadow

If true, the object casts a shadow.

If false, it does not.

Turning this off helps performance if you have many parts.

---

## The Transform Section

This is where you will spend most of your time.

### Position

Where the part is.

You can also drag the part in the 3D view to change this.

### Size

How big the part is.

You can also use the Scale tool in the toolbar.

### Rotation

How the part is tilted, in degrees.

Written as X, Y, Z rotation.

### Orientation

Same idea as Rotation but shown differently.
For most beginner work, use Rotation.

---

## Special Properties for Different Objects

Different objects have different properties.

A Script has a `Source` property, which is the code itself.
A Light has a `Brightness` and `Range` property.
A GUI Button has a `Text` property.

Always check the Properties panel after selecting something.
The options change based on what you selected.

---

## How Properties Are Used in Code

You can read and change properties from a script.

```lua
local part = workspace.Part

-- Read
print(part.Position)
print(part.Color)

-- Change
part.Color = Color3.fromRGB(255, 0, 0)
part.Anchored = true
part.Transparency = 0.5
part.Size = Vector3.new(8, 1, 8)
```

Everything you can do in the Properties panel, you can also do in code.

---

## Practice

Do these steps to get comfortable with the Properties panel.

1. Open Roblox Studio with a Baseplate place
2. Insert a Part into Workspace
3. Click the Part
4. Change its Name to "MyBlock"
5. Change its Color to red
6. Change its Size to 8, 1, 8
7. Change its Position to 0, 0.5, 0
8. Set Anchored to true
9. Set Transparency to 0.3
10. Change its Material to Neon

Look at the Part in the 3D view after each change.

---

## Common Mistakes

Mistake: Forgetting to set Anchored to true while building.

Result: The part falls through the baseplate as soon as you press Play.
Fix: Set Anchored to true for anything that is part of the level.

Mistake: Changing Size but the part does not look bigger.

Result: You may have changed Position by mistake.
Check the Transform section carefully.

Mistake: Making a part transparent but it still blocks movement.

Result: Transparency does not affect collisions.
Set CanCollide to false as well.

Mistake: Using a name already used by another object.

Result: Roblox adds a number.
Rename things with unique and clear names.

Mistake: Trying to change a property that does not exist.

Result: The script errors.
Check the Properties panel first to see what is available.

---

## The Relationship Between Explorer and Properties

Here is the flow you will use every time:

1. Find the object in the Explorer
2. Click it to select it
3. Look at the Properties panel
4. Change what you need
5. Check the 3D view to see the result

That is the loop.
You will repeat it hundreds of times.

---

## Summary

- The Properties panel shows settings for the selected object
- Every object has different properties
- Position, Size, Color, Material are the most common
- Anchored and CanCollide control behavior
- You can change properties in the panel or in code
- Always select an object before changing its properties

Now open Roblox Studio and try the practice steps.

---

Next: [../01-basics/README.md](../01-basics/README.md)
