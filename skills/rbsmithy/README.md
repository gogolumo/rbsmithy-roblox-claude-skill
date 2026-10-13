# RBSmithy Free

MIT Roblox development Agent Skill. Copy the complete rbsmithy folder into your project's .claude/skills/ for Claude Code, or .agents/skills/ for Codex. Start a new session. Native discovery and workflow quality are separate checks; client behavior must be recorded rather than assumed.

Optional structural check (Python 3.11+ standard library):

    python3 rbsmithy/scripts/validate_skill.py --root rbsmithy

Checks local link targets and metadata; short workflows are manual-review advisories. Does not execute Luau, inspect live Studio, run Blender templates or certify game safety. Exit 0: structural checks pass; 1: findings; 2: input/read error.

RBSmithy Pro is separate: https://www.agensi.io/skills/rbsmithy-pro . Free contains no Pro auditor. This skill's source is MIT; external code/assets need separate rights checks.

Support: report redacted minimal reproductions in the public repository. Never post credentials, private game data or purchased Pro files. Updates use new immutable archives; back up custom edits first. Agent hosting may independently require subscription/network access.
