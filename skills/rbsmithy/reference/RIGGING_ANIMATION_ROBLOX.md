# Rigging and Animation for Roblox Assets

Use this for characters, NPC accessories, animated props, doors, ship parts, enemies, and interactive objects.

## Planning

Before rigging, define what moves, what stays static, how many bones are needed, whether Roblox constraints/parts are enough, whether animation belongs in Blender or Roblox Studio, and whether the asset needs avatar compatibility.

## Choices

| Need | Recommended approach |
|---|---|
| simple door/lever | Roblox Tween/constraints |
| ship sails | bones or segmented parts depending complexity |
| NPC accessory | simple attachment-based asset |
| creature | rigged mesh only if necessary |
| prop loop | AnimationController or scripted tween |
