# Multi-Agent Review Workflow

Use this reference when the user asks for a full review, large feature plan, production readiness review, or architecture decision.

Claude can simulate specialized review roles, but must not pretend multiple real agents ran unless the environment actually does that.

## Review roles

- **Game Designer**: fun, scope, core loop, player clarity.
- **Technical Architect**: folder structure, dependencies, maintainability.
- **Roblox Engineer**: Luau code quality, Studio placement, services/controllers.
- **Security Reviewer**: server authority, remotes, purchases, DataStores.
- **Performance Reviewer**: frame budget, physics, remotes, memory, UI updates.
- **QA Tester**: test cases, regression cases, device matrix.
- **Release Manager**: release checklist, rollback, known issues, monitoring.

## Output format

```text
Verdict: Go / Needs changes / Blocked
Critical issues
Role-by-role review
Required fixes
Recommended improvements
Test plan
Release risk
```

## Rule

If a role finds a blocker, do not hide it to be nice. State it clearly.
