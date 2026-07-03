# Performance budgets

Use this file when implementing or reviewing features that may affect FPS, server performance, memory, physics, networking, UI, or mobile devices.

## Rule

Every non-trivial feature needs a performance budget before it gets production code.

## Budget categories

### Instances

Track expected object counts:

- Parts;
- MeshParts;
- constraints;
- attachments;
- particles;
- UI objects;
- sounds;
- scripts/modules.

### Scripts

Track code cost:

- per-frame loops;
- event connections;
- RunService usage;
- expensive table scans;
- pathfinding calls;
- raycasts;
- UI recalculation.

### Network

Track network cost:

- remotes per second;
- payload size;
- replicated instances;
- attributes changed frequently;
- physics ownership behavior.

### Devices

Review:

- mobile low-end;
- tablet;
- console/gamepad;
- desktop;
- slow network;
- long server uptime.

## MicroProfiler review prompts

When performance is poor, ask for:

- FPS/performance summary;
- MicroProfiler screenshot or saved dump;
- instance count;
- server/client distinction;
- steps to reproduce;
- whether StreamingEnabled is on;
- whether the issue occurs in Studio or published server.

## Claude output requirements

For performance-sensitive work, include:

1. expected instance budget;
2. expected remote budget;
3. expected connection budget;
4. per-frame work list;
5. StreamingEnabled notes;
6. mobile risk;
7. MicroProfiler check plan;
8. cleanup plan.
