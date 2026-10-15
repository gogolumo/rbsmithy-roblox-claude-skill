# Rollback Plan Playbook

Inputs: current/prior revisions, save-schema versions, migration behavior, purchase changes and incident evidence. Record missing inputs before declaring rollback safe.

Compare changed save keys, fields, enums and migration functions. Test whether the older reader can consume newly written saves using isolated fixtures. Reverting code cannot undo grants, trades or irreversible migrations; keep code rollback distinct from data rollback.

Prepare regression tests for affected saves and receipts, including failed loads, reconnects and duplicate delivery. Record actual results; when Studio is unavailable, label placement and multi-client steps unexecuted.

Specify target revision, trigger, owner, authorized deployment procedure and abort conditions. Require explicit consent before production deployment or DataStore mutation. Never replay purchases or overwrite saves to make versions look compatible.

Output compatibility findings with paths/versions, test gaps, irreversible effects, monitoring evidence and owner decisions on compensation/communication. Use templates/rollback-plan-template.md as a document template, not executable rollback automation.
