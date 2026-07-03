# LOD, Collision, and Mobile Optimization

## Optimization hierarchy

1. too many objects;
2. too many physics bodies;
3. too many transparent/particle effects;
4. too many unique materials/textures;
5. too much per-frame script work;
6. too many network updates;
7. over-detailed collision;
8. far-away detail that players cannot see.

## LOD strategy

| Distance | Detail |
|---|---|
| near | full readable asset |
| mid | simplified mesh/material |
| far | silhouette only |
| background | billboard/proxy/low-detail chunk |

## Collision strategy

- Use simple proxy parts.
- Disable collision on tiny decorations.
- Use collision groups where appropriate.
- Keep player navigation clean.
- Test jumping, climbing, ship movement, and camera.
