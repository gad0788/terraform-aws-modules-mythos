# Versioning Policy

This repository follows semantic versioning for module releases.

## Version Format

`MAJOR.MINOR.PATCH`

Examples:

- `v1.0.0` - first stable release
- `v1.1.0` - backwards-compatible feature release
- `v1.0.1` - bug fix release
- `v2.0.0` - breaking change release

## When To Bump Versions

- `MAJOR`
  - changing module inputs or outputs in a breaking way
  - removing a resource or default behavior that consumers rely on
- `MINOR`
  - adding a new optional module
  - adding a new variable with a safe default
  - expanding outputs without breaking existing consumers
- `PATCH`
  - bug fixes
  - documentation updates
  - internal refactors with no consumer impact

## Release Rules

1. Keep releases immutable once tagged.
2. Document all changes in release notes.
3. Pin consumer apps to a specific tag.
4. Upgrade consumers intentionally after validation.

## Suggested Tagging

Use git tags like:

```bash
v1.0.0
v1.0.1
v1.1.0
v2.0.0
```

