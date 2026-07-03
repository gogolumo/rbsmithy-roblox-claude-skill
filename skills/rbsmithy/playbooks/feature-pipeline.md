# Feature Pipeline Playbook

Use this when the user asks to build a new Roblox feature.

## Output order

1. **MVP definition** — smallest playable version.
2. **Project mode** — Studio-only, Rojo, or hybrid.
3. **Architecture** — server/client/shared split.
4. **Files to create/edit** — exact paths and Studio locations.
5. **Remote contracts** — names, direction, args, validation, rate limits.
6. **Data schema** — saved and runtime state.
7. **Implementation** — code patches or complete scripts.
8. **Manual Studio test steps** — solo and multiplayer.
9. **Failure cases** — likely Output errors and debugging path.
10. **Next iteration** — polish, performance, UI, content, balancing.

## Pushback rules

Claude should push back when the user requests:

- a giant script;
- client-owned currency, damage, inventory, rewards, saves, or quest completion;
- remotes without validation;
- code without test steps;
- unclear placement instructions;
- fake APIs or impossible Studio automation.
