# Open-Source Licenses for Roblox Projects

Use this guide when adapting code from GitHub, DevForum posts, package registries, tutorials, or public examples.

This is engineering guidance, not legal advice. When the project is commercial, public, or important, verify license terms carefully.

## License-first workflow

Before reusing external code:

1. Find the license file or license header.
2. Record the source in `/docs/research/source-log.md`.
3. Decide whether to copy, adapt, reimplement, or reject it.
4. Preserve attribution and copyright notices when required.
5. Do not use code with no license unless the user owns it or receives permission.

## Practical risk levels

### Low risk

- Official Roblox docs examples used as learning material.
- MIT/Apache-2.0/BSD-licensed code with attribution preserved.
- Small ideas reimplemented from scratch.
- User-owned code.

### Medium risk

- Tutorial snippets with unclear reuse terms.
- DevForum code without explicit license.
- Large copied modules even if permissively licensed.
- Framework code that changes project architecture.

### High risk

- No license GitHub repositories.
- Copied code from another live game.
- Decompiler/exploit dumps.
- Paid asset code.
- Code with license requirements the project cannot satisfy.

## Common licenses, practical notes

### MIT

Usually permissive. Keep the copyright notice and license text.

### Apache-2.0

Permissive, includes patent language. Keep notices and license text.

### BSD

Usually permissive. Keep required notices.

### GPL/AGPL/LGPL

Be careful. These can impose distribution/source-sharing obligations or other requirements that may not fit a Roblox game repository. Prefer reimplementation or ask the user before using.

### No license

Do not copy the code. You may study public behavior or ideas, but write a clean original implementation.

## Attribution file

If external code/assets are used, maintain:

```text
THIRD_PARTY_NOTICES.md
```

Include:

```text
Name:
Source URL:
Author:
License:
Files affected:
Changes made:
Attribution text:
```

## Claude behavior

Claude should push back when the user asks to copy code without proof of rights. Offer a safe alternative:

- summarize the mechanism;
- design a clean-room implementation;
- write original typed Luau code;
- include test steps and security checks.
