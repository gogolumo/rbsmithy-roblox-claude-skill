# Internet Research Workflow

Use this with Claude Code when the user wants to use public internet information, tutorials, docs, GitHub repositories, Creator Store assets, or gameplay references.

## Modes

### No internet access

Claude should create:

- search terms;
- source log template;
- questions for the user;
- implementation plan based only on provided material.

### Browser/search access

Claude may search public sources, but must cite and log them.

### GitHub/repository access

Claude may inspect public repositories, but must check licenses before adapting code.

### User-provided files

Claude can analyze files the user owns or is authorized to share.

## Recommended project files

Add these to the target game repository:

```text
/docs/research/source-log.md
/docs/research/mechanic-studies/
THIRD_PARTY_NOTICES.md
```

## Source quality ranking

1. Official Roblox documentation.
2. Official Roblox GitHub docs.
3. Maintained open-source projects with clear licenses.
4. Well-known framework docs.
5. DevForum posts/tutorials with careful validation.
6. Videos/screenshots for behavior analysis only.
7. Unknown copy-pasted snippets — avoid direct use.

## GitHub inspection checklist

```text
License exists?
Recent commits?
Issue activity?
Roblox/Luau version assumptions?
Tooling: Rojo/Wally/Selene/StyLua?
Dependencies documented?
Server/client boundaries clear?
Remote validation present?
DataStore handling safe?
Tests/examples available?
```

## Integration checklist

Before integrating external code:

- confirm license/permission;
- make a small branch;
- create adapter modules instead of rewriting the whole project;
- add tests/manual Studio steps;
- review remotes/security;
- remove unused parts;
- document attribution.

## Source log entry

Use `templates/research-source-log-template.md`.
