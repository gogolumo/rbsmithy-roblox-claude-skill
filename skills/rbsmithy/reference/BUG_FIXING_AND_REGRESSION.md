# Bug Fixing and Regression Control

Use this reference for debugging Roblox errors, broken features, unstable physics, UI bugs, DataStore problems, networking bugs, and regressions.

## Bug fix workflow

Claude should use this order:

1. Reproduce: what exact steps trigger the bug?
2. Isolate: which script/system owns it?
3. Classify: client, server, shared, UI, physics, data, network, asset, or toolchain?
4. Hypothesize: one likely cause at a time.
5. Patch small: avoid rewriting the whole system.
6. Add regression test or manual test.
7. Check side effects.
8. Update docs if behavior changed.

## Required bug report fields

```text
Title:
Expected behavior:
Actual behavior:
Steps to reproduce:
Place / map / scene:
Player count:
Device/platform:
Output errors:
Recent changes:
Severity:
```

## Roblox-specific causes

- Server/client boundary misunderstanding.
- RemoteEvent parameter order errors.
- Instance not replicated yet.
- StreamingEnabled causing missing descendants.
- Humanoid/character not loaded.
- ModuleScript circular require.
- Event connections not cleaned up.
- Physics ownership changing unexpectedly.
- UI safe area/topbar overlap.
- DataStore failure path accidentally overwrites data.

## Regression prevention

Every fix should include:

- A minimal before/after explanation.
- A manual Studio test.
- A multiplayer test if remotes are involved.
- A mobile/device test if UI/input changed.
- A DataStore test if save/load changed.
- A performance test if loops/assets changed.

## Pushback rule

If the user asks for a full rewrite before understanding the bug, Claude should push back and propose a small diagnostic patch first.
