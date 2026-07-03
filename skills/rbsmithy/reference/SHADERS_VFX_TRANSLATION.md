# Shader and VFX Translation for Roblox

Roblox does not always support the same shader pipeline as Three.js, Unity, or Unreal.

Translate the intention, not the exact shader.

| Desired effect | Roblox-friendly approximation |
|---|---|
| outline shader | Highlight, duplicated mesh/outline trick, UI stroke, stylized geometry |
| water shimmer | SurfaceAppearance, particles, animated textures, lighting/fog |
| dissolve | transparency tween, particle breakup, material swap |
| glow | Neon material, Bloom, lights, particles |
| scanline/glitch | ScreenGui overlay, UI gradients, animated images |
| toon/cel look | lighting choices, flat colors, outlines, material discipline |
