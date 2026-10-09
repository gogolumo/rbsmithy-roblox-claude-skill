# RBSmithy Pro — Offline Auditor CLI

[← Documentation home](README.md) · [Installation](INSTALLATION.md) · [FAQ](FAQ.md)

The paid RBSmithy Pro package includes a **local, read-only Python 3.11+ scanner** for reviewing Roblox/Luau and Rojo project source. This page documents the public command-line interface. **It does not include the auditor's Python source code.**

## Before you start

1. [Download and extract your paid RBSmithy Pro ZIP](INSTALLATION.md) obtained through Agensi.
2. Identify the local directory containing **your own or an authorized** Roblox/Luau project.
3. Check that Python **3.11+** is available using `python3 --version` (or `py -3 --version` on Windows).
4. Open a terminal in the parent directory containing the extracted `rbsmithy-pro/` folder.

## Commands

**Markdown (default):**

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py \
  --project /path/to/your-rojo-project \
  --format markdown
```

**JSON (machine-readable):**

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py \
  --project /path/to/your-rojo-project \
  --format json
```

**Write a report to a local file:**

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py \
  --project /path/to/your-rojo-project \
  --format markdown > rbsmithy-review.md
```

**Fail with nonzero status if HIGH-priority heuristic findings are detected:**

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py \
  --project /path/to/your-rojo-project \
  --fail-on-high
```

**Show version:**

```sh
python3 rbsmithy-pro/scripts/roblox_audit.py --version
```

**Important:** The `--fail-on-high` option is a triage helper, **not** an independent security gate. Exit code 0 does not prove your game is secure or production-ready.

## Arguments

| Argument | Required | What it does |
|---|---|---|
| `--project PATH` | Yes | Selects the local project directory to inspect |
| `--format markdown` | No | Produces a human-readable review (default) |
| `--format json` | No | Produces structured JSON output |
| `--fail-on-high` | No | Exits with status 1 if high-severity heuristic findings exist |
| `--version` | No | Displays the scanner's version |

The purchased package includes the executable at `rbsmithy-pro/scripts/roblox_audit.py`; it is **not** available from the public GitHub documentation.

## Exit status

| Code | Meaning |
|---|---|
| **0** | Scan completed without triggering `--fail-on-high` (findings may still exist) |
| **1** | `--fail-on-high` was used and at least one HIGH-severity heuristic finding was detected |
| **2** | Invalid or unreadable project / scanner input failure |

An invalid command-line option may also be rejected by Python's argument parser. Make sure your command and Python path are correct.

## What's in the report?

The scanner emits evidence-led **review hints**, which can include:

- **Rule identifier:** classifies a pattern to review.
- **Priority/severity:** helps decide what to inspect first; does **not** prove exploitability.
- **Path and line:** points to source for manual investigation.
- **Evidence:** a concise explanation of the suspected pattern.
- **Review action:** a recommended human follow-up.

The JSON output has fields such as `schema_version`, `product_version`, `mode`, `files_scanned`, `findings`, `skipped_paths`, `verification`, `security_certification`, and `limitations`.

The scanner reports `mode: "read-only-offline-static-heuristic"`, `verification: "not-run"`, and `security_certification: false`. These values are intentional: no Roblox Studio tests or security certification occur during static review.

### Interpreting a possible RemoteEvent warning

A result about a client-to-server `OnServerEvent` handler may recommend manual inspection of:

- payload type and value validation;
- player ownership / authorization checks;
- server-side state and purchase ownership;
- per-player rate limiting and replay protection;
- invalid-input and high-rate tests.

Such findings are **not** proof of an exploit. Review the entire relevant call path before deciding whether a change is needed.

### Interpreting persistence guidance

The Pro Agent Skill includes *manual* DataStore, migrations and receipt-handling review workflows. This does **not** imply the offline scanner automatically verifies every persistence invariant.

## Scope and limitations

- The CLI reads eligible `.lua`, `.luau` and Rojo JSON project inputs only, using bounded read-only analysis.
- No source execution, source changes, code upload, telemetry or Studio connection.
- Symlinks and other excluded/unsupported/large inputs may be skipped; inspect skipped paths where reported.
- Pattern matching is not a complete Luau semantic analysis, and Rojo configuration cannot replace a real DataModel inspection.
- A clean scan does **not** guarantee secure remote handlers, correct purchase receipts, DataStore integrity, multiplayer correctness or good performance.
- Always review the flagged code manually and test applicable fixes in Roblox Studio before deploying.

## Useful next step

Ask your agent:

> Use RBSmithy Pro. Read the offline audit report, inspect only the relevant files I authorize, classify findings as evidence vs hypotheses, and propose a manual multi-client Studio verification checklist. Do not modify player data or publish changes without approval.

See [Installation](INSTALLATION.md) if the command is not found; see [FAQ](FAQ.md) for other common problems.

**No paid implementation or proprietary reference documents are distributed from this GitHub page.**
