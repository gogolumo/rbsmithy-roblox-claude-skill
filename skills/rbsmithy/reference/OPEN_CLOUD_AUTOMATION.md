# Open Cloud Automation

Use this reference when the user wants CI/CD, asset uploads, release automation, external dashboards, or creator workflow automation.

## Security first

Open Cloud credentials are secrets.

Never:

- put API keys in ReplicatedStorage;
- commit keys to GitHub;
- paste keys into public logs;
- expose keys to client scripts;
- include keys in generated docs.

Use:

- `.env` ignored by Git;
- GitHub Actions secrets;
- least-privilege permissions;
- separate keys for local/dev/CI;
- rotation plan.

## Good automation targets

- upload build artifacts;
- update place files;
- sync localization CSVs;
- publish release notes;
- validate manifests;
- upload package/model assets where supported;
- query asset metadata;
- run lint/test CI before publish.

## Claude behavior

When Open Cloud is requested:

1. identify exact API goal;
2. list required permissions;
3. create `.env.example`, not `.env` with real keys;
4. add `.gitignore` entries;
5. include failure modes and rollback;
6. warn when an operation is destructive or production-impacting.

## Do not hallucinate endpoints

If an endpoint or file format is unclear, instruct Claude to check official Roblox Open Cloud docs before generating code.
