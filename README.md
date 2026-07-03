<p align="center">
  <img src="assets/rbsmithy-banner.png" alt="RBSmithy — Claude Skill for Roblox Game Development" />
</p>

<h1 align="center">RBSmithy</h1>

<p align="center">
  <strong>A production-ready Claude Skill for serious Roblox game development.</strong>
</p>

<p align="center">
  <a href="https://github.com/gogolumo/rbsmithy-roblox-claude-skill/releases">
    <img src="https://img.shields.io/github/v/release/gogolumo/rbsmithy-roblox-claude-skill?style=for-the-badge&color=7c3aed" alt="Release" />
  </a>
  <img src="https://img.shields.io/badge/Claude-Skill-7c3aed?style=for-the-badge" alt="Claude Skill" />
  <img src="https://img.shields.io/badge/Roblox-Studio-red?style=for-the-badge" alt="Roblox Studio" />
  <img src="https://img.shields.io/badge/Luau-Typed-blue?style=for-the-badge" alt="Luau" />
  <img src="https://img.shields.io/badge/Rojo-Ready-orange?style=for-the-badge" alt="Rojo" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License" />
</p>

---

## What is RBSmithy?

**RBSmithy** is a complete Claude Skill that turns Claude Code into a Roblox game development assistant.

It helps Claude plan, implement, debug, refactor, optimize, and review Roblox games using **Luau**, **Roblox Studio**, **Rojo**, secure multiplayer architecture, DataStores, UI/HUD systems, procedural 3D workflows, Creator Store asset pipelines, QA, analytics, LiveOps, and release management.

RBSmithy is not just a coding prompt.  
It is a practical production workflow for building Roblox games seriously.

---

## Why this exists

Roblox projects often become messy because scripts grow too large, remotes become unsafe, DataStores are handled badly, UI breaks on mobile, and performance problems appear too late.

RBSmithy forces Claude to work like a real Roblox developer:

| Area | What RBSmithy helps with |
|---|---|
| Architecture | Server/client/shared separation, services, controllers, modules |
| Security | Remote validation, rate limits, server authority, anti-exploit reviews |
| Gameplay | Combat, quests, inventory, ships, NPCs, survival systems |
| UI/HUD | Safe areas, responsive scaling, HUD states, mobile support |
| Data | DataStores, migrations, save safety, session handling |
| Assets | Creator Store workflows, asset manifests, procedural models |
| Performance | Low-end optimization, MicroProfiler review, frame budgets |
| Production | QA, analytics, LiveOps, releases, rollback plans |

---

## Skill path

The Claude Skill lives here:

```text
skills/developing-roblox-games/SKILL.md
```

Supporting files are organized into:

```text
skills/developing-roblox-games/
├── reference/
├── systems/
├── playbooks/
├── templates/
├── tooling/
├── prompts/
└── examples/
```

---

## Core features

### Roblox engineering

RBSmithy helps Claude design Roblox projects with clear structure:

```text
ServerScriptService
├── Services

ReplicatedStorage
├── Shared
├── Remotes

StarterPlayer
├── StarterPlayerScripts
│   └── Controllers

StarterGui
└── UI
```

It pushes for:

- typed Luau
- small modules
- reusable ModuleScripts
- clear remotes
- server authority
- manual Roblox Studio test steps
- clean Rojo file paths
- practical bug-fixing workflows

---

### Multiplayer security

RBSmithy follows one important rule:

> Never trust the client.

The skill helps Claude review and build:

- secure RemoteEvents
- RemoteFunction contracts
- rate limits
- server-side damage validation
- currency protection
- inventory protection
- quest progress validation
- anti-exploit checks
- safe admin/debug commands

---

### Game systems

RBSmithy includes blueprints and workflows for many Roblox systems:

- inventory systems
- quest systems
- dialogue systems
- combat systems
- ships and vehicles
- NPCs and AI directors
- HUD and UI systems
- saving and profile data
- economy and shops
- matchmaking
- achievements and badges
- party and crew systems
- bug reporting
- analytics and telemetry
- LiveOps and release planning

---

### Dialogue and narrative design

RBSmithy can help create deeper NPC dialogue by analyzing:

- character voice
- subtext
- emotional conflict
- pacing
- player choice
- quest purpose
- scene function
- inspiration from literature, films, and games

It does **not** copy scenes or dialogue from copyrighted works.  
It studies structure and creates original writing for your Roblox game.

---

### Procedural 3D model generation

RBSmithy supports procedural Roblox model workflows using:

- Claude Code
- Rojo
- Luau model builders
- Roblox Studio Command Bar
- part-based low-poly models
- Creator Store asset manifests

It can help generate:

- ships
- props
- buildings
- islands
- NPC placeholders
- low-poly environment kits

It also considers:

- triangle budgets
- part counts
- collision complexity
- mobile performance
- low-end fallback models
- visual style consistency

---

### Creator Store asset workflow

RBSmithy can help Claude use existing Roblox Creator Store assets safely through:

- asset briefs
- search terms
- asset manifests
- review folders
- import commands
- asset sanitizers
- license/permission checks
- procedural fallbacks when an asset is not suitable

The goal is not to blindly insert random free models.  
The goal is to build a controlled asset pipeline.

---

### Internet research and mechanic inspiration

RBSmithy can help study:

- public tutorials
- official Roblox documentation
- open-source Roblox/Luau repositories
- gameplay videos
- reference games
- mechanic breakdowns

It uses a clean-room adaptation approach:

1. Study the behavior.
2. Extract the design pattern.
3. Avoid copying protected code or assets.
4. Build an original implementation for your project.
5. Document the source of inspiration.

---

### Optimization for low-end devices

RBSmithy includes low-end optimization workflows for:

- rendering
- scripts
- physics
- networking
- UI
- particles
- memory
- terrain
- assets
- mobile devices

It helps Claude avoid guessing and instead diagnose the real bottleneck.

---

### Build Doctor

RBSmithy includes a project health workflow called **Build Doctor**.

It can review a Roblox project and produce a scorecard like:

```text
Architecture: 7/10
Security: 6/10
Data safety: 8/10
Performance: 5/10
Mobile / low-end: 4/10
UI/UX: 7/10
Content consistency: 8/10
Tests: 3/10
Analytics: 5/10
Release readiness: 4/10
```

Then it gives the most important fixes before release.

---

## Example prompts

Use prompts like these with Claude Code:

```text
Use the developing-roblox-games skill. Review my Roblox project architecture and tell me what is wrong.
```

```text
Use the developing-roblox-games skill. Create a secure typed Luau inventory system with DataStore saving.
```

```text
Use the developing-roblox-games skill. Build a ship movement system with server authority and client HUD feedback.
```

```text
Use the developing-roblox-games skill. Generate a low-poly island outpost using procedural Roblox parts and Rojo.
```

```text
Use the developing-roblox-games skill. Review my RemoteEvent code for exploits.
```

```text
Use the developing-roblox-games skill. Optimize this game for low-end phones.
```

```text
Use the developing-roblox-games skill. Write deep NPC dialogue for a lighthouse keeper based on my quest outline.
```

```text
Use the developing-roblox-games skill. Run Build Doctor on my Roblox project.
```

---

## Installation

### Claude Code personal skill

Install once and use across many Roblox projects:

```bash
mkdir -p ~/.claude/skills
cp -R skills/developing-roblox-games ~/.claude/skills/
```

Then restart Claude Code.

---

### Project-level skill

Copy the skill into your Roblox project:

```text
your-roblox-project/
└── .claude/
    └── skills/
        └── developing-roblox-games/
```

This makes the skill available only inside that project.

---

## Recommended Roblox toolchain

RBSmithy works best with:

| Tool | Purpose |
|---|---|
| Roblox Studio | Main editor |
| Claude Code | AI coding assistant |
| Rojo | File sync between code editor and Studio |
| Luau | Roblox scripting language |
| Wally | Package management |
| Selene | Luau linting |
| StyLua | Code formatting |
| GitHub | Version control |

---

## What RBSmithy will push back against

RBSmithy is opinionated. It should reject bad Roblox development habits:

- giant scripts
- unsafe remotes
- client-owned money, damage, rewards, or saves
- DataStore code without failure handling
- UI with no mobile testing
- no test steps
- no folder structure
- messy untyped code
- copying code from other games
- adding huge features before making a playable vertical slice
- overengineering a small MVP
- ignoring low-end devices

---

## Repository structure

```text
rbsmithy-roblox-claude-skill/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── FINAL_TEST_PROMPTS.md
└── skills/
    └── developing-roblox-games/
        ├── SKILL.md
        ├── reference/
        ├── systems/
        ├── playbooks/
        ├── templates/
        ├── tooling/
        ├── prompts/
        └── examples/
```

---

## Release focus

RBSmithy is designed around a full Roblox production pipeline:

```text
Design
→ MVP / vertical slice
→ Architecture
→ Implementation
→ Security review
→ Testing
→ Localization
→ Accessibility
→ Analytics
→ Performance budget
→ Release checklist
→ Rollback plan
→ LiveOps iteration
```

---

## License

This project is licensed under the MIT License.

---

## Status

RBSmithy is intended as a practical, production-focused Claude Skill for Roblox developers who want better architecture, safer multiplayer code, cleaner systems, stronger optimization, and a more professional development workflow.
