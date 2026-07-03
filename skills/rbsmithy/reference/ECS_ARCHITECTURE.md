# ECS Architecture

Use this reference only for advanced systems with many entities or high update complexity.

## When ECS can help

- hundreds of NPCs;
- projectiles;
- effects;
- resource nodes;
- large simulations;
- modular status effects;
- repeated entity behavior patterns.

## When ECS is overkill

- simple inventory;
- quest state;
- DataStore profiles;
- basic UI;
- one-off bosses;
- small prototypes.

## Rule

Do not force ECS into a beginner project. Use services/controllers/modules first. Suggest ECS only when object count, update frequency, or composability justify it.

## ECS design

Components hold data:

```text
Position
Velocity
Health
Faction
AggroTarget
Renderable
```

Systems hold behavior:

```text
MovementSystem
CombatSystem
AggroSystem
CleanupSystem
```

## Claude behavior

If using ECS:

- explain why ECS is justified;
- keep server authority;
- define components before systems;
- avoid mixing business logic into components;
- add performance budget;
- include migration path from current architecture.
