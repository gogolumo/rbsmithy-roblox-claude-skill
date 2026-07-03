# Blender Production Pipeline for Roblox

## Blender stages

1. Blockout
2. Primary forms
3. Secondary forms
4. Detail pass
5. Cleanup
6. UV/material pass
7. Collision proxy
8. Export
9. Roblox import
10. QA

## Blender checklist before export

- Apply scale.
- Apply rotation.
- Set origin/pivot intentionally.
- Check normals.
- Remove hidden junk objects.
- Remove construction helpers.
- Name objects clearly.
- Keep material slots simple.
- Use clean collections.
- Avoid accidental tiny geometry.
- Check non-manifold geometry.
- Check loose vertices.
- Check duplicate faces.
- Split giant assets into modular chunks.

## Roblox-friendly export thinking

Prefer modular pieces, simple collision proxies, useful pivots, clear names, simple materials, strong silhouettes, and repeatable kits.
