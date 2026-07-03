# Package management

Use this file when adding Wally packages or external dependencies.

## Rules

- Do not add packages without a reason.
- Check license.
- Pin versions.
- Document where packages sync in Rojo.
- Avoid adding large frameworks for small features.
- Never put API keys or secrets into package config.

## Claude output requirements

For dependencies, include:

- package name;
- purpose;
- license note;
- install command;
- Rojo path;
- fallback if package is unavailable.
