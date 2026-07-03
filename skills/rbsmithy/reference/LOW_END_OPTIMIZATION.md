# Low-End Optimization

Use this reference whenever the user asks for performance, mobile support, weak PC support, lag fixes, memory reduction, or “make it run better.”

## Goal

Optimize for frame rate, memory usage, load time, network usage, and stability. Do not optimize blindly; measure first when possible, then reduce the biggest bottleneck.

## Baseline device rule

Pick a low-end target profile before building expensive features:

```text
Baseline device: low-end Android or old laptop
Target: stable gameplay, acceptable visuals, no OOM crashes
Test scenes: starter area, combat, ship sailing, town, boss fight
```

## Main bottleneck categories

### Rendering

- Too many visible parts/meshes.
- Too many transparent objects.
- Expensive lighting/shadows.
- High texture memory.
- Large decorative scenes with no streaming plan.

### Scripts

- Expensive per-frame loops.
- Too many connections.
- Polling instead of events.
- Large table scans every frame.
- Debug prints left in production.

### Physics

- Too many unanchored parts.
- Complex collisions.
- Vehicles with unstable constraints.
- Unnecessary touch events.
- Bad network ownership decisions.

### UI

- Updating every label every frame.
- Too many animated elements.
- Large images.
- UI created/destroyed constantly instead of reused.

### Networking

- Remote spam.
- Sending large tables.
- Client requesting too often.
- Server broadcasting to everyone instead of relevant players.

## Optimization pass format

Claude should produce:

```text
Observed / suspected issue:
Likely bottleneck:
Evidence needed:
Quick fix:
Proper fix:
Risk:
Test steps:
```

## Weak hardware rules

For low-end support:

- Use StreamingEnabled-friendly code.
- Avoid assuming distant models are loaded.
- Reduce decorative object count before reducing important gameplay clarity.
- Prefer simpler collision geometry.
- Add graphics quality fallbacks.
- Keep ship/town scenes under a defined object budget.
- Use pooled effects for combat, splashes, and UI particles.
- Limit expensive ambience loops and region checks.

## Claude behavior

When asked to optimize, Claude should not rewrite random code first. It should:

1. Ask for or infer the target device.
2. Identify scene/system likely causing lag.
3. Check scripts, remotes, physics, UI, assets, and streaming.
4. Suggest measurement: MicroProfiler, memory, Stats panel, local server test.
5. Produce safe changes and regression tests.
