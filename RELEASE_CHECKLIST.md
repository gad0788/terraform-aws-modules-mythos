# Release Checklist

Use this checklist before publishing a module release.

## Versioning

- Confirm the next version number follows semantic versioning
- Decide whether the release is `major`, `minor`, or `patch`
- Update `CHANGELOG.md`
- Add or update a release note in `releases/`

## Validation

- Run `terraform fmt`
- Run `terraform validate`
- Review plan output for the demo app in dev
- Review plan output for the demo app in prod if needed

## Consumer Check

- Confirm the demo app still pins to the intended tag
- Confirm only the expected modules are enabled
- Confirm variables are documented and still match the module inputs

## Publishing

- Tag the repository with the release version, for example `v1.0.0`
- Publish the release note
- Communicate upgrade notes to consumer teams

## Post-Release

- Watch for consumer issues after upgrade
- Keep future changes small and release them as new tags
