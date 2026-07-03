# Third-Party 3D Skill Interop

RBSmithy can cooperate with external skills, but it should remain the Roblox authority.

| Skill family | Good for | RBSmithy keeps responsibility for |
|---|---|---|
| 3D modeling specialist | topology, UVs, retopology, LOD review | Roblox gameplay fit and import constraints |
| Blender procedural skill | bpy/bmesh scripts | Roblox asset budgets and import QA |
| 3D design team | modeling, texturing, rigging, animation | Roblox-specific simplification |
| Three.js/WebGL skills | preview scenes, shaders, browser prototypes | converting ideas back to Roblox |
| Game creator skills | game architecture, scenes, systems | Roblox Luau/Rojo implementation |
| Design skillstacks | visual language, animation, presentation | Roblox performance and implementation |

## Co-use prompts

```text
Use RBSmithy and my installed Blender procedural modeling skill. Generate a stylized Roblox dock kit in Blender Python, then give import and collision steps.
```

```text
Use RBSmithy and my installed 3D modeling specialist skill. Review this model for topology, UVs, normals, LODs, and Roblox mobile performance.
```
