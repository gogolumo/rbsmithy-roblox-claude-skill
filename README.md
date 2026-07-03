<h1 align="center">RBSmithy</h1>

<p align="center">
  <strong>Claude Skill for Roblox game development — Luau, Rojo, multiplayer systems, 3D Asset Forge, optimization, QA, and production-ready releases.</strong>
</p>

<p align="center">
  <img width="1280" alt="RBSmithy banner" src="assets/rbsmithy-banner.png">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude-Skill-7c3aed?style=for-the-badge" alt="Claude Skill" />
  <img src="https://img.shields.io/badge/Roblox-Luau-e2231a?style=for-the-badge&logo=roblox&logoColor=white" alt="Roblox Luau" />
  <img src="https://img.shields.io/badge/Rojo-Ready-f97316?style=for-the-badge" alt="Rojo Ready" />
  <img src="https://img.shields.io/badge/3D_Asset_Forge-Blender_to_Roblox-8b5cf6?style=for-the-badge" alt="3D Asset Forge" />
  <img src="https://img.shields.io/badge/Multiplayer-Server_Authoritative-2563eb?style=for-the-badge" alt="Server Authoritative Multiplayer" />
  <img src="https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge" alt="MIT License" />
</p>

<p align="center">
  <a href="#what-is-rbsmithy">Overview</a> ·
  <a href="#3d-asset-forge">3D Asset Forge</a> ·
  <a href="#quick-install">Install</a> ·
  <a href="#example-prompts">Prompts</a> ·
  <a href="#skill-structure">Structure</a>
</p>

---

## What is RBSmithy?

**RBSmithy** is a Claude Skill that turns Claude Code into a practical Roblox game development assistant.

It helps with the full Roblox development loop:

- planning game systems;
- writing clean Luau;
- organizing Rojo-friendly projects;
- building server-authoritative multiplayer systems;
- designing DataStore-safe save flows;
- reviewing RemoteEvents and RemoteFunctions for exploit risks;
- creating Roblox-ready 3D asset briefs;
- generating Blender Python blockouts and procedural asset kits;
- planning MeshPart import, collision, LODs, and mobile performance;
- preparing QA checklists and release-ready reviews.

> RBSmithy is not a random-script generator.  
> It is a production workflow skill for Roblox systems, assets, performance, and release quality.

---

## Why RBSmithy?

Roblox projects often break because AI writes code without understanding Roblox-specific constraints.

| Common AI mistake | RBSmithy behavior |
|---|---|
| Trusts the client | Pushes server authority for currency, inventory, rewards, damage, saves, and quest state |
| Creates random scripts | Gives Studio paths, Rojo paths, dependencies, and test steps |
| Ignores exploits | Reviews remotes, rate limits, validation, and ownership checks |
| Breaks mobile UI | Checks safe areas, scaling, touch controls, and small screens |
| Makes heavy models | Adds budgets for meshes, parts, materials, textures, collision, and LODs |
| Ignores import workflow | Adds Blender export, Roblox import, pivot, scale, material, and collision checks |
| Ships untested code | Adds manual tests, multiplayer tests, regression checks, and rollback notes |

---

## 3D Asset Forge

RBSmithy includes a **3D Asset Forge** workflow for Roblox-ready models and assets.

It helps Claude think like a Roblox technical artist, Blender procedural modeler, topology reviewer, optimization helper, and QA reviewer.

### 3D workflow

```text
Asset idea
→ art direction
→ silhouette
→ budget
→ blockout
→ Blender model or Roblox Part factory
→ topology / UV / materials
→ export
→ Roblox import
→ collision
→ LODs
→ mobile QA
```

### 3D Asset Forge covers

| Area | What it helps with |
|---|---|
| **Blender** | blockouts, manual build steps, procedural Python scripts, bmesh planning |
| **Topology** | clean geometry, normals, retopology notes, N-gon warnings |
| **UVs** | UV islands, texel density, texture atlas planning |
| **MeshPart import** | scale, pivot, orientation, materials, bounding boxes, collision |
| **Roblox Parts** | Studio-native prototype models using Part-based Luau factories |
| **Modular kits** | docks, villages, ruins, island props, ship upgrades, market stalls |
| **Vehicles/ships** | visual hull, collision hull, physics root, sails, upgrades, LODs |
| **NPC accessories** | masks, tools, bags, armor pieces, faction identity props |
| **Materials** | Roblox-friendly material simplification and texture budgets |
| **VFX translation** | shader-like ideas converted into Roblox-friendly effects |
| **Optimization** | mobile performance, LODs, part counts, material counts, collision proxies |
| **QA** | model scorecards, import checklists, go/fix/rebuild verdicts |

### 3D rule

```text
Strong silhouette first.
Clean collision second.
Pretty details third.
```

RBSmithy should not pretend text alone creates perfect final FBX models. It should produce a practical build path: Blender plan, optional script, export notes, Roblox import steps, collision setup, performance risks, and QA checklist.

---

## Core workflow

```text
Plan → Implement → Verify → Optimize → Ship
```

RBSmithy should always try to answer with:

1. what to build;
2. where the files go;
3. what the server owns;
4. what the client owns;
5. what can be exploited;
6. how to test it in Studio;
7. what can break on low-end devices;
8. what should be simplified before release.

---

## Quick Install

### Personal Claude Code skill

Install once and use in any Roblox project:

```bash
mkdir -p ~/.claude/skills
cp -R skills/rbsmithy ~/.claude/skills/
```

Restart Claude Code.

Then use:

```text
Use RBSmithy. Review this Roblox feature plan before I implement it.
```

### Project-level skill

Install only inside one Roblox project:

```text
your-roblox-project/
└── .claude/
    └── skills/
        └── rbsmithy/
```

Project-level install is recommended for serious games.

---

## Capabilities

| Area | What RBSmithy helps with |
|---|---|
| **Luau** | typed modules, services, controllers, shared configs, clean APIs |
| **Rojo** | filesystem layout, project structure, Studio placement |
| **Multiplayer** | server authority, replication, remotes, anti-exploit checks |
| **DataStores** | schema versions, defaults, migrations, safe saves, retries |
| **UI/HUD** | responsive Roblox UI, safe areas, controller/mobile readability |
| **3D assets** | Blender pipeline, MeshPart import, Part factories, modular kits |
| **Creator Store** | source, license, scripts, collisions, part count, style fit |
| **Combat** | cooldowns, hit validation, damage ownership, feedback loops |
| **Quests** | data-driven quests, rewards, progression, journal/markers |
| **NPCs** | dialogue, schedules, simple AI states, performance budgets |
| **Optimization** | memory, physics, remotes, particles, streaming, mobile performance |
| **QA** | test plans, exploit checks, regression tests, release readiness |

---

## Example prompts

### Roblox systems

```text
Use RBSmithy. Create a server-authoritative inventory system for a Roblox game.
```

```text
Use RBSmithy. Review this RemoteEvent for exploits and rewrite it safely.
```

```text
Use RBSmithy. Convert this Roblox Studio-only structure into a Rojo-friendly file plan.
```

```text
Use RBSmithy. Build a DataStore schema with versioning, defaults, and safe migration notes.
```

### 3D Asset Forge

```text
Use RBSmithy 3D Asset Forge. Create a full Roblox-ready 3D asset brief for a stylized ship, including Blender plan, export, collision, LOD, and mobile budget.
```

```text
Use RBSmithy 3D Asset Forge. Write a Blender Python script for a modular low-poly dock kit, then give Roblox import and collision instructions.
```

```text
Use RBSmithy 3D Asset Forge. Create a Roblox Part-based prototype model for this asset using Luau.
```

```text
Use RBSmithy 3D Asset Forge. Review this model for topology, UVs, normals, material count, collision, and Roblox mobile performance.
```

```text
Use RBSmithy 3D Asset Forge. Convert this reference into an original Roblox-ready model plan without copying the design.
```

```text
Use RBSmithy 3D Asset Forge. Make an asset family: modular village kit, hero building, repeated props, LODs, and collision proxies.
```

---

## Production guardrails

RBSmithy should push back when a request would make a weak Roblox project.

### It should not blindly:

- trust the client;
- let the client award money, items, XP, damage, or quest progress;
- create unvalidated RemoteEvents;
- ignore rate limits;
- save raw client payloads;
- insert random Creator Store models without review;
- add heavy particles or physics without a budget;
- use complex mesh collision everywhere;
- generate giant one-piece models when modular kits are better;
- write giant scripts with no module split;
- skip Studio test steps.

### It should always care about:

- exploit resistance;
- replication behavior;
- low-end hardware;
- mobile UI;
- Studio testing;
- clean file structure;
- maintainability;
- asset budgets;
- collision clarity;
- release readiness.

---

## Skill structure

```text
rbsmithy-roblox-claude-skill/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── FINAL_TEST_PROMPTS.md
├── assets/
│   └── rbsmithy-banner.png
└── skills/
    └── rbsmithy/
        ├── SKILL.md
        ├── reference/
        │   ├── 3D_ASSET_FORGE_DIRECTOR.md
        │   ├── BLENDER_PRODUCTION_PIPELINE.md
        │   ├── PROCEDURAL_BLENDER_COOKBOOK.md
        │   ├── ROBLOX_MESHPART_IMPORT_PIPELINE.md
        │   └── LOD_COLLISION_MOBILE_OPTIMIZATION.md
        ├── playbooks/
        ├── templates/
        ├── prompts/
        ├── examples/
        ├── systems/
        └── tooling/
```

---

## Recommended Roblox architecture

```text
ReplicatedStorage/
├── Shared/
├── Config/
├── Remotes/
└── Assets/

ServerScriptService/
└── Services/

StarterPlayer/
└── StarterPlayerScripts/
    └── Controllers/

StarterGui/
└── UI/

Workspace/
└── AssetReview/
```

### Rule

```text
Server owns truth.
Client owns presentation.
Shared owns contracts and config.
Assets must pass budget and import review.
```

---

## Release readiness checklist

Before shipping a Roblox update, RBSmithy should check:

- [ ] important state is server-owned;
- [ ] remotes validate arguments and ownership;
- [ ] DataStore writes are safe;
- [ ] mobile UI is readable;
- [ ] 3D assets have sane scale, pivot, collision, and material count;
- [ ] repeated models are optimized;
- [ ] performance is acceptable on weak devices;
- [ ] multiplayer behavior is tested;
- [ ] rollback notes exist;
- [ ] known bugs are documented;
- [ ] release notes are clear.

---

## Best use cases

RBSmithy is especially useful for:

- Roblox adventure games;
- simulator systems;
- combat systems;
- multiplayer co-op projects;
- ship and vehicle mechanics;
- quest and dialogue systems;
- inventory and save systems;
- UI/HUD implementation;
- Blender-to-Roblox asset workflows;
- Creator Store asset review;
- modular environment kits;
- release QA.

---

## FAQ

### Is this a Roblox Studio plugin?

No. It is a **Claude Skill** for Claude Code. It guides Claude while it plans, writes, reviews, and improves your Roblox project.

### Does it generate finished 3D models?

It can generate strong asset briefs, procedural Blender Python blockouts, Roblox Part-based prototypes, and import/optimization checklists. Final production models still need inspection in Blender and Roblox Studio.

### Can it use Creator Store assets?

Yes, but with review: source, license, scripts, collisions, part count, mesh count, texture size, style fit, and performance budget should be checked.

### Does it replace testing?

No. RBSmithy should produce test steps, but you still test in Roblox Studio.

---

## License

MIT License.

---

<p align="center">
  <strong>RBSmithy helps Claude build Roblox games like an actual development workflow — not random scripts.</strong>
</p>
