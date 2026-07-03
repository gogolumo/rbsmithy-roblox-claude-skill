# Playbook: Competitor Mechanic Analysis

Use this when the user wants to learn from a public Roblox experience or another game without direct access to source code.

## What Claude can analyze

Claude can analyze:

- visible gameplay behavior;
- UI flow;
- timing and feel;
- progression loops;
- player feedback;
- monetization flow at a high level;
- onboarding/tutorial structure;
- combat pacing;
- movement feel;
- camera behavior;
- multiplayer flow.

Claude must not claim it can inspect hidden source code of a public Roblox experience.

## Data the user can provide

- gameplay video;
- screenshots;
- description of controls;
- timing notes;
- UI screenshots;
- public docs/devlog;
- public repository links;
- Creator Store asset IDs;
- their own exported files.

## Analysis template

```text
Reference game/place:
Observed mechanic:
Player goal:
Input model:
Feedback model:
State machine:
Server-authoritative parts we need:
Client-side display parts we need:
Potential exploit surfaces:
Original implementation proposal:
How our version will differ:
```

## Clean-room implementation

Build from the observation, not from hidden code:

1. Write a spec from observed behavior.
2. Do not copy names, UI, maps, art, audio, or code.
3. Implement with project-specific modules and typed Luau.
4. Tune values independently.
5. Test against the desired feel.

## Example

Reference:

```text
A public Roblox battlegrounds game has responsive dashes and combo attacks.
```

Safe output:

```text
We can build an original dash/combo system with similar responsiveness: client input prediction, server cooldown validation, server damage authority, and animation markers. We will not copy the game's code, VFX, animation IDs, move names, UI, or tuning values.
```
