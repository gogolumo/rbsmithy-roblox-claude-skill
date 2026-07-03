# CI, lint, format, and test workflow

Use this file when adding automated checks to a Roblox project.

## Recommended checks

- JSON validity for Rojo project files.
- Selene lint for Luau source.
- StyLua format check.
- Markdown lint if desired.
- Basic file tree validation.

## GitHub Actions strategy

Keep CI simple at first:

1. install/pin tools;
2. run formatter check;
3. run linter;
4. fail fast with readable errors.

## Claude output requirements

When adding CI, include:

- files to add;
- local commands;
- GitHub Actions workflow;
- how to fix common failures;
- what CI does not test.
