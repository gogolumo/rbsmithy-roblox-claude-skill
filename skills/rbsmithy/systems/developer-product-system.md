# Developer product system blueprint

## Purpose
Handle repeatable purchases such as consumables or currency bundles safely.

## Server responsibilities
- Process receipt once.
- Grant idempotently.
- Save before marking processed when possible.
- Handle retry behavior.

## Client responsibilities
- Prompt purchase only.
- Wait for server-confirmed reward state.

## Critical risks
- duplicate receipt processing;
- granting reward before save safety;
- trusting client purchase claims.
