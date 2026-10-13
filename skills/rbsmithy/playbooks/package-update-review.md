# Package Update Review Playbook

Inputs: old/new versions, source diff, installed consumers, exported APIs and save/remote dependencies. Do not import unreviewed scripts or update production places automatically.

Compare module signatures, RemoteEvent contracts, dependency constraints and save-schema assumptions. Review new network calls, privileged actions, hidden scripts and license/ownership changes. Tokens alone cannot establish safety.

Exercise a minimal old consumer against the new package in an isolated environment. Include malformed remote payloads, missing dependencies and reconnect/migration cases where affected. Record commands and outcomes; label Studio tests unexecuted if unavailable.

Output a compatibility table, required consumer changes, source/license evidence, regression results and rollback plan. Block release on an unresolved critical defect, missing ownership, or an incompatible consumer without a documented migration. Preserve immutable previous releases.

Read reference/ROBLOX_PACKAGES.md for platform workflow and playbooks/rollback-plan.md for rollback analysis. This Free workflow supplies review guidance; it does not include the paid auditor.
