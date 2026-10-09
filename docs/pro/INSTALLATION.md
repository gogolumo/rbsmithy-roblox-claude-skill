# Install RBSmithy Pro 1.0.0

[← Documentation home](README.md) · [Auditor CLI →](CLI_GUIDE.md)

This page explains **how to install the ZIP you purchased on Agensi**. It does not host the Pro package.

## Requirements

- A legitimate copy of **RBSmithy Pro 1.0.0** obtained from Agensi.
- A compatible Agent Skills host for agent-guided workflows (e.g., Claude Code or Codex), **or** a local terminal for the standalone auditor.
- **Python 3.11+** for the optional offline Luau/Rojo auditor. The Python script uses only the standard library.
- Access to your **own or authorized** Roblox/Luau source project. Rojo-based working trees are convenient; code existing only inside Roblox Studio must be exported/provided for static review.

No Roblox credentials, API tokens, paid model API keys, or network access are needed by the offline scanner.

## 1. Extract the purchased ZIP

Download the RBSmithy Pro ZIP from your Agensi purchase.

After extraction, verify that there is **one directory** named `rbsmithy-pro` with this *structure*:

```text
rbsmithy-pro/
  SKILL.md
  README.md
  LICENSE.txt
  scripts/
  references/
  examples/
  templates/
```

These are path names to check **inside your purchased ZIP**. No Pro files are distributed by this documentation page.

**Do not** install only the `SKILL.md` file, and do not mix the Pro folder with the MIT-licensed `rbsmithy` Free folder. Keep the name `rbsmithy-pro` so references continue to resolve.

## 2. Choose your agent host

### Claude Code — personal installation

On macOS/Linux, the target is:

```text
~/.claude/skills/rbsmithy-pro/SKILL.md
```

Copy the **entire extracted** `rbsmithy-pro/` folder into `~/.claude/skills/`.

Example, from the directory containing the extracted folder:

```sh
mkdir -p ~/.claude/skills
cp -R rbsmithy-pro ~/.claude/skills/
```

On Windows, the corresponding personal skills directory is normally under your user profile, `%USERPROFILE%\.claude\skills\`. Consult your installed Claude Code version's skills documentation if the directory differs.

If `rbsmithy-pro/` is already installed, back it up and replace it intentionally rather than merging unknown old files. Reload/restart Claude Code, then ask:

> Use RBSmithy Pro to review the current Roblox project. Start by identifying whether it is Studio-only, Rojo or hybrid, and tell me which files you inspected.

### Codex — project installation

A project-local location supported by the included instructions is:

```text
<your-project>/.agents/skills/rbsmithy-pro/SKILL.md
```

Copy the entire folder there, then reload the Codex session in that project.

Example from your Roblox project's root:

```sh
mkdir -p .agents/skills
cp -R /path/to/extracted/rbsmithy-pro .agents/skills/
```

Ask:

> Use RBSmithy Pro to inspect the current Rojo project. Show evidence and unknowns separately, and propose multiplayer tests without claiming to have run them.

Some versions or configurations of an Agent Skills host require their own registration or discovery rules. **Agent discovery has not been verified for every version or system**, so use your host's documentation if activation does not occur.

### Other Agent Skills hosts

If your agent supports compatible `SKILL.md` directories, follow that host's installation rules. Installing the folder in a random path does not guarantee the host will discover it.

## 3. Run the offline auditor (optional)

You can use the Python checker directly without opening an agent.

From the directory containing the extracted `rbsmithy-pro/` folder:

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py \
  --project /path/to/your-rojo-project \
  --format markdown
```

Use a real local project directory for `--project`. The `--project` path is **not** the skill installation path; it is the directory of the Roblox/Luau source project you want to review.

A JSON output option is available:

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py \
  --project /path/to/your-rojo-project \
  --format json
```

Full options, report interpretation and exit codes: [Auditor CLI guide](CLI_GUIDE.md).

### macOS/Linux Python check

```sh
python3 --version
```

Check for **3.11 or later**.

### Windows Python check

```powershell
py -3 --version
```

If Python is installed and its version is 3.11+, use PowerShell with the actual extracted directory path, for example:

```powershell
py -3 "C:\path\to\rbsmithy-pro\scripts\roblox_audit.py" --project "C:\path\to\my-roblox-project" --format markdown
```

These commands are installation examples, not a guarantee that Python or the relevant Agent Skills host is already set up on your device.

## 4. Interpret and validate

Treat output as **review hints**, not verified exploits. Review each finding against the original source and test your authorized Roblox project with real multiplayer and save/reconnect scenarios.

The scanner is **read-only and offline**. It does not edit your scripts, install dependencies, push commits, alter DataStores, or connect to Roblox servers.

## Next steps

1. [Learn the CLI](CLI_GUIDE.md), including `--fail-on-high` and return codes.
2. [Troubleshoot installation](FAQ.md).
3. Use your agent to draft a manual Studio QA checklist before release.

**Never share the purchased ZIP, private Pro source, production DataStore data or account credentials in a public issue.**
