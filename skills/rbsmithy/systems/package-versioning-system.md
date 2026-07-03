# Package Versioning System Blueprint

## Purpose
Turn repeated assets/systems into reusable, documented, versioned packages.

## Package contents

```text
PackageName/
  README.md
  VERSION.md
  CHANGELOG.md
  TESTS.md
  Config.luau
```

## Good package data
- version number;
- required children;
- required tags/attributes;
- setup steps;
- known limitations;
- upgrade notes.

## Manual tests
- insert fresh package into empty test place;
- update old copy to new version;
- verify no map-specific paths break;
- verify package does not contain suspicious scripts.
