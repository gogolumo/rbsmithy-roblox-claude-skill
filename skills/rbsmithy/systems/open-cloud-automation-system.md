# Open Cloud Automation System Blueprint

## Purpose
Plan safe external automation for Roblox creator workflows.

## Supported tasks
- validate asset manifests;
- upload approved artifacts where supported;
- sync localization files;
- build release reports;
- publish docs or release notes;
- CI checks before release.

## Security requirements
- `.env.example` only;
- real secrets in local env/GitHub secrets;
- never expose keys to Roblox client;
- least-privilege credentials;
- destructive commands require confirmation.
