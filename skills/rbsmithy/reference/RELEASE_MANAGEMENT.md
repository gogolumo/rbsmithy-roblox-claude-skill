# Release Management

Use this reference before publishing updates, changing persistence schemas, adding monetization, adding new remotes, or modifying major gameplay systems.

## Release types

- **Patch**: bug fixes, small balance changes, UI fixes.
- **Minor update**: new quest, item, island, UI screen, or small system.
- **Major update**: new core loop, save schema, monetization, matchmaking, combat rewrite.

## Pre-release checklist

- all new remotes validated and rate-limited;
- DataStore migration tested with old data samples;
- analytics events added for the new feature;
- mobile/tablet/gamepad UI checked;
- performance budget reviewed;
- localization keys added;
- monetization reviewed for fairness;
- known issues documented;
- rollback plan written;
- manual multiplayer test completed.

## Rollback plan

Every release that touches saves or purchases needs a rollback plan:

```text
What version can we roll back to?
Will old servers still write compatible data?
Can new data be read by old code?
What data migration is irreversible?
How will players be compensated if progression breaks?
```

## Patch notes

Patch notes should be player-facing and honest:

```text
Added
Fixed
Changed
Known issues
```

Do not promise unreleased content.

## Post-release monitoring

After release, check:

- error reports;
- DataStore warnings;
- funnel changes;
- retention changes;
- purchase issues;
- player reports;
- performance regressions.
