# Experiment System Blueprint

## Purpose
Centralize A/B test configuration and variant decisions.

## Server responsibilities
- decide variants for server-owned gameplay;
- expose safe variant results to clients;
- log analytics events with variant IDs;
- prevent client from choosing reward/economy variants.

## Client responsibilities
- adjust UI or local presentation based on assigned variant;
- never invent or override server-owned variants.

## Shared modules
- `ExperimentConfig.luau`
- `ExperimentTypes.luau`

## Common variants
- tutorial flow A/B;
- reward timing;
- UI layout;
- onboarding quest order;
- matchmaking rules.

## Manual tests
- force variant A in config;
- force variant B in config;
- verify analytics include variant key;
- verify rollback to control works.
