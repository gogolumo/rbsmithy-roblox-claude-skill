# Topology, UV, Retopology, Normals

## Topology rules

- Deforming objects should use clean quad-based topology.
- Hard-surface props can use triangles strategically, but avoid messy topology.
- Avoid N-gons in final production geometry.
- Keep edge flow intentional.
- Avoid long thin triangles when possible.
- Avoid duplicate faces.
- Avoid non-manifold geometry.
- Remove hidden/internal faces if they never render.
- Use bevels for readable stylized edges, not infinite geometry detail.

## UV rules

- Keep UV islands logical.
- Avoid extreme stretching.
- Keep texel density consistent where visible.
- Leave padding between islands.
- Mirror UVs only when asymmetry is not needed.
- For Roblox, consider whether texture detail will even be visible in gameplay camera.

## Normals rules

- Recalculate normals before export.
- Inspect face orientation.
- Use auto smooth/sharp edges intentionally.
- Check mirrored objects for flipped normals.
- If shading looks broken in Roblox, suspect normals/material simplification first.
