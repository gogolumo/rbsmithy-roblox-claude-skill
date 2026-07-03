# Frame budget review playbook

Use before shipping expensive features.

## Budget table
For each feature, estimate:

- instances created;
- remotes per second;
- RunService connections;
- active animations;
- raycasts per second;
- UI updates per second;
- cleanup path.

## Pushback rule
If a feature needs constant per-frame work for many players, require batching, throttling, or event-driven design.
