# Strict Luau Migration

## Goal

Typed Luau should improve correctness without freezing development. Do not rewrite the whole project into strict mode in one risky pass.

## Migration levels

### Level 1: document shapes

Add comments and type aliases for important data structures without changing runtime logic.

### Level 2: type public module APIs

Add exported types and typed function signatures to modules that other scripts require.

### Level 3: type service state

Type important dictionaries and service state tables:

- player profiles;
- inventory maps;
- quest state;
- cooldowns;
- active dialogue sessions;
- vehicle seats/ownership.

### Level 4: strict new files

Use `--!strict` for new modules and services unless the project has a clear incompatible convention.

### Level 5: refactor unsafe old modules

Refactor old code only after tests exist. Prefer small patches.

## Claude behavior

When asked to modernize messy code, Claude should not blindly convert everything. It should:

1. identify critical modules;
2. add types to boundaries first;
3. avoid changing behavior and types in the same huge patch;
4. include Studio test steps after each stage;
5. keep compatibility with existing project structure.
