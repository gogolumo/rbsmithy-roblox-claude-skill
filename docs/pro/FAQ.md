# RBSmithy Pro — FAQ & Troubleshooting

[← Documentation home](README.md) · [Installation](INSTALLATION.md) · [Auditor CLI](CLI_GUIDE.md)

## Purchasing and access

### Where do I download RBSmithy Pro?

From your purchase/download flow on **Agensi**, not from GitHub. This public documentation contains **no paid Pro ZIP or implementation files**. Do not rely on unofficial mirrors or reuploads.

### Is RBSmithy Pro the same as RBSmithy Free?

No. The public, MIT-licensed [RBSmithy Free](../../README.md) focuses on broad Roblox development workflows. RBSmithy Pro 1.0.0 is a separate, paid, production-review-oriented Agent Skill with an offline Python auditor and additional release/security review materials.

### Does this GitHub documentation include the Pro skill?

**No.** No downloadable paid `SKILL.md`, `roblox_audit.py`, internal paid playbooks, code templates or proprietary package contents are published here. The documents describe product operation and provide examples of commands only.

### Is it a subscription?

The original 1.0.0 listing was prepared as a **one-time purchase**. Actual price, payment, refunds, licensing and availability depend on the Agensi listing and the terms presented at checkout. The paid ZIP includes the applicable license.

### Can I use RBSmithy Pro for commercial Roblox games?

The Pro package's personal license permits its named purchaser to use it for their own development work, including commercial Roblox projects. It does **not** permit sharing or reselling the paid Pro package. Refer to the full license shipped in the purchased ZIP and applicable marketplace/consumer terms.

## Using the product

### Do I need Roblox Studio running?

**No** for the offline CLI. It reviews local eligible source files. You **do** need Roblox Studio or an appropriate authorized environment to test game behavior, actual multiplayer security, DataStores, purchases, device compatibility and release readiness.

### Does it work with a Studio-only project?

The CLI scans files on disk. If your scripts exist only inside a Studio place, you must first export/provide the authorized source in an inspectable local form. No Studio live connection is included.

### What is Rojo?

Rojo is an independent workflow for syncing Roblox Studio development with a filesystem-based source tree. RBSmithy Pro can review local Luau files and relevant Rojo project inputs, but cannot reconstruct all Roblox runtime/Studio behavior from them.

### Is RBSmithy Pro a Roblox Studio plugin or web dashboard?

No. It is an Agent Skill plus a local Python static-review CLI. Videos and marketplace graphics may use illustrative motion graphics; they are **not** a representation of a live SaaS product.

### Does it auto-fix bugs or stop exploits?

No. It flags potential patterns and provides review guidance. Developers investigate findings, decide on changes, run tests, and deploy. Never treat a finding as a verified vulnerability without investigation.

### Does an empty report mean my Roblox game is safe?

**No.** It means the configured static checks did not match in the scanned inputs. Coverage is incomplete by design, and files may have been excluded or skipped. Validate server authority, persistence and receipts, multiplayer behavior and device performance separately.

### Does it upload my Roblox code?

The bundled offline Python scanner is designed to read local source **without uploading it or making network requests**. An external Agent Skills host or other tools you choose to use can have different data-handling behavior; review those services' settings and policies separately.

## Troubleshooting

### Claude Code or Codex does not recognize the skill

1. Confirm that you installed the **whole folder**, not just the `SKILL.md` file.
2. Confirm its layout ends in `rbsmithy-pro/SKILL.md` — no extra accidental nesting such as `rbsmithy-pro/rbsmithy-pro/SKILL.md`.
3. Check your installed host's supported Agent Skills location and compatibility.
4. Reload/restart the agent session.
5. Try explicitly requesting **“Use RBSmithy Pro”**.
6. If recognition still fails, consult the host documentation; automated discovery has not been tested across every host/version.

See [Installation](INSTALLATION.md).

### `python3: command not found` or wrong Python version

Install/configure **Python 3.11+** and ensure it is on your PATH. On Windows, try `py -3 --version` and use `py -3` to invoke the script if that resolves to Python 3.11+.

### Python says it cannot open `roblox_audit.py`

Your current directory and script path do not match. Locate the **purchased** `rbsmithy-pro/scripts/roblox_audit.py` file, then provide its actual absolute or relative path to Python.

### The scanner exits with code 2

Check that the value passed to `--project` is a readable **directory** containing the project source and that supported inputs are accessible. An invalid or unreadable project can result in exit code 2.

### The scanner reports a false positive

That is possible: it uses static heuristic patterns, not full execution. Read the evidence and surrounding code, decide whether a compensating validation exists elsewhere, and document your manual verification. Do not automatically change code solely to silence a flag.

### Why didn't the scanner detect a particular bug?

Static patterns cannot prove all runtime behaviors and do not inspect the live Studio DataModel. Review skipped files, Rojo mappings, DataStore/purchase flows, and manual Studio QA. Missing findings are not a warranty.

### How do I report a problem?

For a purchase/delivery issue, use Agensi's order/support mechanisms when available. For documentation problems, you can reference this repository, but do **not** publicly upload paid Pro content, complete private source code, player data or credentials.

## Legal and product notes

RBSmithy Pro is an independent product, not affiliated with, approved by, or endorsed by Roblox Corporation, Anthropic, OpenAI or Agensi. The developer remains responsible for project changes, publishing, security, data protection and compliance. Purchasing Pro does not affect the original MIT license of RBSmithy Free.

**Documentation version:** 1.0.0 · [Back to overview](README.md)
