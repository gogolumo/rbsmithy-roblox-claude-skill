# Module Require Debug Playbook

## Checklist

- Does the ModuleScript return exactly one value?
- Is the path correct in Studio hierarchy?
- Is there a circular require?
- Is a server-only module being required by the client?
- Is a plugin-only module being required by normal game code?
- Did Rojo sync the file as the expected class?

## Fix style

Claude should show the correct require path for Studio and Rojo modes separately when needed.
