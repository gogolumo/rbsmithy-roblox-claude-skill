# Animation Pipeline

Use this reference when adding NPC animations, combat attacks, dialogue gestures, ship steering, tool animations, or non-Humanoid animated models.

## Animation asset workflow

- prototype with placeholders;
- define animation registry IDs;
- publish/upload real animations in Studio;
- replace placeholder IDs;
- test rig compatibility;
- document ownership and usage.

## Animation registry

Do not scatter raw animation IDs everywhere. Use a registry module:

```text
ReplicatedStorage/Shared/Animations/AnimationRegistry
```

Categories:

```text
Player
NPC
Combat
Dialogue
Ship
UI
```

## State machine

For NPCs and combat, prefer a small state machine:

```text
Idle -> Walk -> AttackWindup -> AttackRecover -> Idle
Idle -> Talk -> Gesture -> Talk -> Idle
```

## Common bugs

- wrong rig type;
- animation asset not owned/accessible;
- missing Animator;
- tracks not stopped/cleaned up;
- conflicting animation priorities;
- server/client mismatch for cosmetic animations;
- AnimationController needed for non-Humanoid models.

## Claude behavior

When generating animation code:

- include placeholders for real asset IDs;
- do not invent working animation IDs;
- isolate animation loading/playback in a controller/service;
- include cleanup;
- document where to publish and replace IDs.
