# 3D Model Art Budgets

Use this reference when generating, importing, reviewing, or optimizing Roblox models. Claude should decide model complexity from gameplay importance, screen size, platform target, and reuse count.

## Important Roblox constraints

Roblox has mesh specifications and individual mesh triangle limits. Do not assume unlimited geometry. If unsure, check the current Creator Hub art specifications before giving exact limits.

## Budget thinking

Do not ask “how many polygons can I use?” first. Ask:

- How close is the camera?
- How many copies exist at once?
- Is it interactive or decorative?
- Is it visible on mobile?
- Does it need precise collision?
- Can detail be texture/normal/color instead of geometry?
- Can distant versions be simpler?

## Practical budget tiers

These are conservative planning tiers, not hard Roblox rules:

| Asset type | Use case | Preferred style |
|---|---|---|
| Tiny prop | coins, bottles, rope coils | very simple mesh/parts, texture detail |
| Repeated prop | crates, barrels, trees, rocks | low triangle count, reusable variants |
| Medium hero prop | cannon, chest, shrine | moderate detail, optimized collision |
| Vehicle/ship | player hub, seen often | segmented model, simple collision hull, LOD plan |
| Boss/NPC | animated focus object | detail concentrated on silhouette/face/weapons |
| Background island prop | seen from distance | big shape language, very cheap geometry |

## Procedural model generation rules

When Claude generates Roblox models from Luau Parts:

- Prioritize silhouette over tiny details.
- Use fewer Parts for repeated objects.
- Use Models with clear PrimaryPart.
- Group decorative parts under named folders.
- Set collision only where gameplay needs it.
- Use Attributes for metadata: `AssetRole`, `BudgetTier`, `Approved`, `GeneratedBy`.
- Provide a review checklist after spawning.

## Mesh import review

For imported meshes, Claude should request or create an asset review:

- triangle estimate or source export stats;
- MeshPart count;
- texture count and resolution;
- collision fidelity choice;
- render fidelity choice;
- anchored/unanchored count;
- scripts/remotes hidden inside model;
- mobile risk;
- memory risk;
- reuse count.

## Model design from inspiration

Allowed:

- Use broad references: “cozy fishing village,” “wind-worn lighthouse,” “chunky Wind-Waker-like silhouette,” “brass-and-parchment naval UI.”
- Extract shape language: round, square, tall, sagging, angular, handmade, ceremonial.

Avoid:

- Directly copying copyrighted characters, ships, props, or recognizable designs.
- Claiming Claude can import private meshes into Studio without a real import workflow.

## Output requirements for model tasks

Claude should output:

1. Asset purpose.
2. Visual style and silhouette.
3. Budget tier and reasoning.
4. Model hierarchy.
5. Generation/import workflow.
6. Collision plan.
7. Performance risks.
8. Studio test steps.
9. Fallback if asset is too heavy.
