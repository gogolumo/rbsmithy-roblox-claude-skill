# Mechanic Reference System Blueprint

Use this blueprint when the user wants to study a mechanic from another game, tutorial, open-source project, video, or public place and build an original version in their Roblox game.

## Purpose

Turn external inspiration into a safe, original, project-specific implementation.

Examples:

- melee combat inspired by another Roblox game;
- sprinting/dashing inspired by a popular game;
- anti-cheat pattern inspired by open-source code;
- dialogue camera behavior inspired by an RPG;
- ship steering inspired by a sailing game;
- inventory UI inspired by a survival game.

## Inputs

Ask for or inspect:

- source links, videos, screenshots, code, repository, or asset IDs;
- whether the user owns or has permission to use the code/assets;
- desired mechanic behavior;
- current project structure;
- target platform support: PC, mobile, gamepad;
- multiplayer requirements.

## Research stages

### 1. Source classification

Classify every source:

```text
Official docs
Open-source code
Tutorial/example
Creator Store asset
User-owned project
Public game observation
Unknown/untrusted
```

### 2. License/permission check

For source code/assets, check whether reuse is allowed. If unclear, treat it as inspiration only.

### 3. Mechanic decomposition

Break the mechanic into neutral parts:

```text
Inputs
State
Timing
Cooldowns
Animations
Server validation
Client prediction/display
Data saved
UI feedback
Failure cases
Exploit surface
```

### 4. Original design

Produce a design that fits the current project instead of copying the source.

### 5. Implementation

Create project-specific files and code using the skill's normal architecture rules.

## Output format

```text
Reference summary
Source/permission notes
What we will not copy
Mechanic breakdown
Original implementation design
Server/client/shared split
Remote contracts
Files to create/edit
Code
Studio/Rojo placement
Manual tests
Exploit tests
Attribution/third-party notes
```

## Example: sprint mechanic

Reference behavior:

```text
Hold Shift to sprint, stamina drains, stamina regenerates after a delay, camera FOV slightly increases.
```

Original implementation:

```text
Client:
- reads input;
- displays stamina bar;
- applies local FOV feedback.

Server:
- validates sprint state;
- enforces stamina/cooldown;
- owns authoritative WalkSpeed changes.

Shared:
- SprintConfig module with stamina drain/regeneration values.
```

## Example: combat mechanic

Reference behavior:

```text
Click to attack, short combo chain, hitbox appears in front of player, target takes damage.
```

Original implementation:

```text
Client:
- sends attack intent only;
- plays local anticipation effects.

Server:
- validates cooldown, weapon, range, facing, target state;
- computes hitbox or server raycast;
- applies damage.

Shared:
- weapon data, combo timing, hitbox shape definitions.
```

## Rule

Never produce a "same as game X" implementation. Produce an implementation inspired by a design pattern and adapted to this project.
