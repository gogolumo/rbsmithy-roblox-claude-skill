<h1 align="center">RBSmithy</h1>

<p align="center">
  <strong>Claude Skill for Roblox game development — Luau, Rojo, multiplayer systems, 3D assets, optimization, QA, and production-ready releases.</strong>
</p>

<p align="center">
  <img width="1280" alt="RBSmithy banner" src="assets/rbsmithy-banner.png">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude-Skill-7c3aed?style=for-the-badge" alt="Claude Skill" />
  <img src="https://img.shields.io/badge/Roblox-Luau-e2231a?style=for-the-badge&logo=roblox&logoColor=white" alt="Roblox Luau" />
  <img src="https://img.shields.io/badge/Rojo-Ready-f97316?style=for-the-badge" alt="Rojo Ready" />
  <img src="https://img.shields.io/badge/Multiplayer-Server_Authoritative-2563eb?style=for-the-badge" alt="Server Authoritative Multiplayer" />
  <img src="https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge" alt="MIT License" />
</p>

<p align="center">
  <a href="#quick-install">Quick Install</a> ·
  <a href="#what-is-rbsmithy">Overview</a> ·
  <a href="#capabilities">Capabilities</a> ·
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
- reviewing RemoteEvents and RemoteFunctions for exploits;
- creating 3D asset briefs and procedural Roblox asset plans;
- optimizing UI, physics, replication, memory, and mobile performance;
- preparing QA checklists and release-ready reviews.

> RBSmithy is not a magic “make my game” button.  
> It is a production workflow skill that makes Claude think like a Roblox technical designer, gameplay programmer, QA helper, and release reviewer.

---

## Why RBSmithy?

Roblox projects often break because AI writes code without understanding Roblox-specific rules.

| Common AI mistake | RBSmithy behavior |
|---|---|
| Trusts the client | Pushes server authority for currency, inventory, saves, damage, rewards, and quest state |
| Creates random scripts | Gives Studio paths, Rojo paths, dependencies, and test steps |
| Ignores exploits | Reviews remotes, rate limits, validation, and ownership checks |
| Breaks mobile UI | Checks safe areas, scaling, touch controls, and small screens |
| Overloads the map | Adds budgets for parts, meshes, particles, physics, and streaming |
| Writes vague systems | Uses feature specs, contracts, acceptance criteria, and failure cases |
| Ships untested code | Adds manual tests, multiplayer tests, and rollback notes |

---

## Core workflow

```text
Plan → Implement → Verify → Optimize → Ship
```

RBSmithy should always try to answer with:

1. **what to build;**
2. **where the files go;**
3. **what the server owns;**
4. **what the client owns;**
5. **what can be exploited;**
6. **how to test it in Studio;**
7. **what can break on low-end devices.**

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

Recommended for serious game projects.

---

## Capabilities

| Area | What RBSmithy helps with |
|---|---|
| **Luau** | typed modules, services, controllers, shared configs, clean APIs |
| **Rojo** | filesystem layout, project structure, Studio placement |
| **Multiplayer** | server authority, replication, remotes, anti-exploit checks |
| **DataStores** | schema versions, defaults, migrations, safe saves, retries |
| **UI/HUD** | responsive Roblox UI, safe areas, controller/mobile readability |
| **3D assets** | procedural part-based assets, model briefs, budgets, import checklists |
| **Creator Store** | safe asset review, manifest files, license/source notes |
| **Combat** | cooldowns, hit validation, damage ownership, feedback loops |
| **Quests** | data-driven quests, rewards, progression, journal/markers |
| **NPCs** | dialogue, schedules, simple AI states, performance budgets |
| **Optimization** | memory, physics, remotes, particles, streaming, mobile performance |
| **QA** | test plans, exploit checks, regression tests, release readiness |

---

## Example prompts

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

```text
Use RBSmithy. Design a mobile-friendly HUD for health, stamina, currency, and quickbar.
```

```text
Use RBSmithy. Create a procedural low-poly island prop kit using Roblox Parts.
```

```text
Use RBSmithy. Run a release readiness review for my Roblox project.
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
        ├── playbooks/
        ├── templates/
        ├── prompts/
        └── examples/
```

---

## Recommended Roblox architecture

```text
ReplicatedStorage/
├── Shared/
├── Config/
├── Remotes/
└── Packages/

ServerScriptService/
└── Services/

StarterPlayer/
└── StarterPlayerScripts/
    └── Controllers/

StarterGui/
└── UI/
```

### Rule

```text
Server owns truth.
Client owns presentation.
Shared owns contracts and config.
```

---

## Release readiness checklist

Before shipping a Roblox update, RBSmithy should check:

- [ ] important state is server-owned;
- [ ] remotes validate arguments and ownership;
- [ ] DataStore writes are safe;
- [ ] mobile UI is readable;
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
- ship/vehicle mechanics;
- quest and dialogue systems;
- inventory and save systems;
- UI/HUD implementation;
- Creator Store asset review;
- release QA.

---

## FAQ

### Is this a Roblox Studio plugin?

No. It is a **Claude Skill** for Claude Code. It guides Claude while it plans, writes, reviews, and improves your Roblox project.

### Does it generate finished 3D models?

It can help create procedural Roblox Part-based assets and model briefs. It should not pretend that text alone magically imports perfect FBX models.

### Can it use Creator Store assets?

Yes, but with review: source, license, scripts, collisions, part count, style fit, and performance budget should be checked.

### Does it replace testing?

No. RBSmithy should produce test steps, but you still test in Roblox Studio.

---

## License

MIT License.

---

<p align="center">
  <strong>RBSmithy helps Claude build Roblox games like an actual development workflow — not random scripts.</strong>
</p>
