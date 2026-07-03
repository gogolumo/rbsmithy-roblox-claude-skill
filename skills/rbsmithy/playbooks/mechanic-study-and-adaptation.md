# Playbook: Study and Adapt a Mechanic

Use this when the user says things like:

- "Make combat like this game."
- "Study how sprint works there and add it to our game."
- "Use this open-source anti-cheat as reference."
- "Look at this Roblox place and build the same kind of interaction."

## Hard boundary

Do not copy closed-source game code, leaked code, decompiled code, exploit dumps, private assets, or exact copyrighted expression. Study ideas and produce an original implementation.

## Step 1: Identify source type

```text
Source:
Type:
Access method:
License/permission:
Can reuse code directly? yes/no/unknown
Can use as inspiration? yes/no
Risk level: low/medium/high
```

If risk is high, refuse direct copying and switch to clean-room implementation.

## Step 2: Extract behavior, not code

Describe the mechanic in abstract terms:

```text
Player input:
State machine:
Timing:
Cooldown:
Server authority:
Client feedback:
UI feedback:
Data persistence:
Exploit risks:
```

## Step 3: Design for this project

Map the behavior into the current architecture:

```text
ServerScriptService/Services/...
StarterPlayer/StarterPlayerScripts/Controllers/...
ReplicatedStorage/Shared/...
ReplicatedStorage/Remotes/...
StarterGui/...
```

## Step 4: Build original code

Use typed Luau for new modules. Avoid copying identifiers, structure, magic numbers, and exact architecture from a protected source unless allowed.

## Step 5: Compare with reference

Use this table:

```text
Reference behavior | Our version | Reason for difference
```

The goal is gameplay feel, not code cloning.

## Step 6: Test

Include:

- solo Studio test;
- two-player local server test;
- exploit attempt test;
- respawn test;
- mobile input test if relevant;
- lag assumption test.

## Refusal language

When the user asks to copy protected code:

```text
I can't help copy or use code from a game you don't own or don't have permission to reuse. I can study the visible mechanic and build an original Roblox-safe version with the same design goal.
```
