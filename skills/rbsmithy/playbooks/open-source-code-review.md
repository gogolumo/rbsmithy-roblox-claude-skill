# Playbook: Open-Source Roblox Code Review

Use this when the user provides or links an open-source Roblox/Luau repository and wants to reuse, adapt, or learn from it.

## Review order

1. License and attribution.
2. Project structure.
3. Dependency/tooling setup.
4. Server/client/shared split.
5. Remote security.
6. DataStore safety.
7. Performance risks.
8. Code quality and typed Luau usage.
9. Integration difficulty.
10. Recommendation: use, adapt, reimplement, or reject.

## Output format

```text
Repository/source:
License:
Can use directly:
Attribution needed:
Architecture notes:
Good ideas to adapt:
Code/architecture risks:
Security risks:
Integration plan:
Files to create/edit in our project:
What to avoid copying:
```

## Integration modes

### Learn only

Use when license is unclear or architecture is incompatible. Produce original code.

### Adapt small parts

Use when license is permissive and the code is small. Preserve notices.

### Vendor dependency

Use when the project intentionally depends on the package. Add Wally/Git submodule instructions only if appropriate.

### Reject

Use when code is insecure, unlicensed, too large, exploit-like, outdated, or incompatible.

## Security review checks

- Can the client change server-owned state?
- Are RemoteEvents validated?
- Are cooldowns enforced server-side?
- Are player objects trusted incorrectly?
- Does code save client-provided data directly?
- Are loops and connections cleaned up?
- Does the code assume single-player behavior?

## Attribution

If used, update `THIRD_PARTY_NOTICES.md` and `/docs/research/source-log.md`.
