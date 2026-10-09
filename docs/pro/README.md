# RBSmithy Pro — Documentation

**Build safer. Ship smarter.**

Documentation for **RBSmithy Pro 1.0.0**, an independent, paid Agent Skill and **read-only offline Roblox/Luau project review toolkit**.

> **Documentation only.** This GitHub directory does **not** contain the RBSmithy Pro download, `SKILL.md`, Python auditor source, private playbooks, templates, license key, or any other paid deliverable. The Pro package is distributed to eligible purchasers through its Agensi listing. The public [RBSmithy Free repository](../../README.md) is a different, MIT-licensed product.

## Documentation

| Topic | Description |
|---|---|
| [Installation & quick start](INSTALLATION.md) | Getting the purchased ZIP into Claude Code or Codex, running your first review |
| [Offline auditor CLI](CLI_GUIDE.md) | Commands, output formats, exit codes, and how to interpret findings |
| [FAQ & troubleshooting](FAQ.md) | Compatibility, limitations, privacy, usage rights, common setup issues |

## What is RBSmithy Pro?

RBSmithy Pro helps developers **review Roblox/Luau and Rojo projects before shipping**. It combines:

- **Offline source review:** read-only inspection of eligible local `.lua` / `.luau` files and relevant Rojo JSON project files using a Python 3.11+ command.
- **Evidence-led findings:** review hints with rule identifiers, paths, line numbers, severity labels and suggested follow-ups.
- **Multiplayer security reviews:** guidance on RemoteEvents, server-owned state, player permissions, cooldowns and rate limits.
- **Persistence & purchase reviews:** checklists for DataStore failures, migration risks, session handling and developer-product receipts.
- **Release readiness:** human-reviewed test plans, conditional GO / NO-GO decisions and rollback preparation.
- **Production workflows:** investigation, QA and feature-delivery guidance when used inside a compatible Agent Skills host.

The offline scanner **does not run your game, execute source files, modify files, connect to Roblox Studio, upload code, or certify security**. Its results are heuristic; findings require developer verification. The full range of production guidance is provided in the paid Agent Skill, not this documentation.

## How it works

```text
Purchase RBSmithy Pro on Agensi
            |
Download and extract your purchase
            |
Install rbsmithy-pro/ as an Agent Skill (optional)
            |
Run read-only auditor against your OWN local Luau/Rojo project
            |
Review evidence and priorities with your agent
            |
Verify fixes with Roblox Studio and multiplayer tests
            |
Prepare release / rollback decisions
```

### Quick start after purchase

From a terminal, when the extracted folder is in your current directory:

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py --project /path/to/your-rojo-project --format markdown
```

Or ask a compatible agent:

> Use RBSmithy Pro. Review my own Rojo project for risky RemoteEvents, persistence failures and release readiness. Clearly distinguish code evidence from assumptions and list tests that still need to be run in Roblox Studio.

The CLI requires **Python 3.11 or later**. The Agent Skill instructions can still be read without Python, depending on your agent host. Exact installation steps are in [Installation](INSTALLATION.md).

## RBSmithy Free vs RBSmithy Pro

| | RBSmithy Free | RBSmithy Pro |
|---|---|---|
| Distribution | Public GitHub repository | Paid ZIP supplied through Agensi |
| License | MIT | Separate personal license in purchased ZIP |
| Focus | Broad Roblox game development assistance | Focused risk review, QA and release preparation |
| Offline Python project auditor | Not included in the Free edition described here | Included in Pro |
| Source code download from this documentation | No | **No** |

RBSmithy Pro is a separate product. Purchasing Pro does not remove or reduce any rights to the publicly available MIT-licensed Free edition.

## Important limitations

- **Not a Roblox Studio plugin:** no automatic Studio installation or live DataModel inspection.
- **Not automatic protection:** a clean scan is not proof that a game is secure or free of data-loss risks.
- **Not a live runtime test:** multiplayer, purchases, save/reconnect behavior and performance must still be verified in Roblox Studio or appropriate test environments.
- **Compatibility varies:** Agent Skills support differs across host applications and versions.
- **Not a repair bot:** the scanner doesn't automatically modify source code. Any game changes remain under the developer's control.
- **No independent endorsement:** RBSmithy Pro is not affiliated with or endorsed by Roblox Corporation, Anthropic, OpenAI, or Agensi.

## Getting access and support

The Pro ZIP is **not hosted in this GitHub documentation**. Obtain it using your purchase/download flow on **Agensi**. After purchase, refer to [Installation](INSTALLATION.md) for setup.

For purchase or delivery problems, use Agensi's available order/support process. If you report a documentation issue publicly, **do not post private project code, player data, keys, receipts, access tokens or your purchased Pro files**.

**Version documented:** 1.0.0 · **Publisher:** [gogolumo](https://github.com/gogolumo) · **Documentation language:** English
