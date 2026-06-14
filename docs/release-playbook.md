# Release Playbook

Use this playbook for every release tag.

## Before Release

- Merge the final change into `main`.
- Verify `terraform fmt` and `terraform validate` pass.
- Confirm Checkov and docs checks are green.
- Update `CHANGELOG.md`.
- Add or update the matching file in `releases/`.
- Confirm the demo app still points to the intended version.

## Version Choice

- `patch` for docs and safe fixes.
- `minor` for backward-compatible features.
- `major` for breaking changes.

## Release Execution

- Run the GitHub Actions `Release` workflow from `main`.
- Provide the version without the leading `v`.
- Ensure the matching `releases/vX.Y.Z.md` file exists.
- Confirm the release tag is published on GitHub.

## After Release

- Update consumer references to the new tag when ready.
- Watch for issues from external adopters.
- Keep the next change small and well-scoped.

## Notes

- Do not tag unreleased or unvalidated code.
- Do not publish a release without notes.
- Keep release automation limited to maintainers.
