# Procedural Blender Cookbook

Use this when writing Blender Python for generated assets.

## Method choice

| Method | Best for |
|---|---|
| `bpy.ops.mesh.primitive_*` | quick blockout primitives |
| `mesh.from_pydata()` | simple custom static meshes |
| `bmesh` | extrusions, subdivisions, face operations, procedural topology |
| curves | ropes, pipes, rails, vines, cables |
| modifiers | arrays, bevels, mirrors, solidify, booleans, non-destructive variants |
| geometry nodes | advanced procedural assets when user will edit in Blender |

## Script structure

```text
imports
config
cleanup
materials
helpers
geometry creation
modifiers
origin setup
naming
validation notes
optional export notes
```

## Procedural rules

- Start small.
- Use named config values.
- Keep objects named and grouped.
- Separate mesh generation from materials.
- Avoid thousands of `bpy.ops` calls.
- Use bmesh for many face operations.
- Free bmesh after use.
- Update mesh after creating vertices/faces.
- Apply transforms before export.
- Leave comments for dimensions and style parameters.
