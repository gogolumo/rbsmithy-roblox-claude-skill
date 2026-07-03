# Rojo Setup

## Purpose

Use Rojo when the Roblox project should be source-controlled, edited in VS Code/Claude Code, and synced into Roblox Studio.

## Basic commands

```bash
rojo init roblox-game
rojo serve default.project.json
```

In Studio, install/open the Rojo plugin and connect to the local Rojo server.

## Recommended folders

```text
src/server      -> ServerScriptService
src/client      -> StarterPlayerScripts
src/shared      -> ReplicatedStorage/Shared
src/gui         -> StarterGui
src/plugin      -> plugin scripts/dev tools when configured separately
```

## Model files

For complex Studio-authored models, prefer `.rbxmx`/`.rbxm` files instead of typing every property by hand. Keep generated procedural blueprints in Luau when repeatability matters.
