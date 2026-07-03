# NPC Animation System Blueprint

## Purpose
Give NPCs consistent idle, work, dialogue, combat, and gesture animations.

## Requirements
- AnimationController or Humanoid/Animator present;
- animation registry entry;
- state machine per NPC role;
- cleanup when NPC despawns.

## Common NPC states

```text
Idle
Patrol
Work
Talk
Gesture
Alert
Attack
Flee
```

## Debug checklist
- Animator exists;
- animation asset is accessible;
- rig type matches;
- priorities do not conflict;
- tracks stop when dialogue ends;
- NPC does not rotate away from camera during talk.
