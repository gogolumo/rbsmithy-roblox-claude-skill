# Localization System Blueprint

## Purpose
Provide stable localization keys for UI, dialogue, quests, items, shops, tutorials, and toasts.

## Server responsibilities
- send stable keys and data, not hardcoded English sentences, when possible;
- never use localized display text as datastore IDs;
- validate language-independent config IDs.

## Client responsibilities
- resolve keys into display text;
- update UI when locale/settings change;
- use fallback text for missing keys;
- format variables safely.

## Shared modules
- `LocalizationKeys.luau`
- `LocalizationFallbacks.luau`
- `LocalizationFormat.luau`

## Data shape

```luau
export type LocalizationEntry = {
    key: string,
    context: string,
    fallback: string,
}
```

## Manual tests
- switch Studio locale/language if possible;
- verify missing keys show obvious fallback;
- test long strings on mobile;
- test dialogue with variables.
