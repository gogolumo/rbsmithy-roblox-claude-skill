# Project Documentation Generator

Use this reference when code changes should update docs, or when the user asks Claude to explain the current project.

## Recommended docs folder

```text
docs/
  architecture.md
  remotes.md
  datastores.md
  analytics.md
  controls.md
  assets.md
  localization.md
  testing.md
  known-bugs.md
  release-notes.md
  research/
    source-log.md
```

## Docs update rule

When a feature adds/removes these, update docs:

- RemoteEvent/RemoteFunction
- DataStore schema
- analytics event
- user-facing text/localization key
- new control/action
- monetization product
- imported third-party asset
- Open Cloud workflow
- release checklist item

## Style

Docs should be practical, not essay-like:

- table of remotes;
- table of DataStore keys;
- exact script locations;
- setup steps;
- failure modes;
- owner/responsibility.

## Claude behavior

When finishing a significant change, suggest or include docs updates. Do not leave architecture knowledge trapped in chat.
