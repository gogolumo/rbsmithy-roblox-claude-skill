# Roblox MeshPart Import Pipeline

## Import checklist

After importing a mesh into Roblox Studio:

- check scale;
- check orientation;
- check pivot/origin;
- check material appearance;
- check collisions;
- check anchoring;
- check bounding box;
- test camera readability;
- test mobile performance;
- check memory/texture cost;
- place it in a review folder before production.

## Recommended folders

```text
ReplicatedStorage/Assets/Meshes
ReplicatedStorage/Assets/Materials
Workspace/AssetReview
```

## Collision

For most assets, simple collision boxes are better than detailed mesh collision. Separate invisible collision proxy parts are often best.
