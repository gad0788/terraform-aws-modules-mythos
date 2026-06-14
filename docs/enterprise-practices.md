# Enterprise Practices

Recommended operating practices for teams consuming or maintaining this repository.

## Repository Controls

- Protect `main` with required PR reviews.
- Require the PR workflow to pass before merge.
- Use `CODEOWNERS` for automatic review routing.
- Keep release permissions limited to a small maintainer group.

## Supply Chain Hygiene

- Use semantic version tags only.
- Pin consumer apps to a release tag, not `main`.
- Keep `pre-commit` enabled for local validation.
- Run secret scanning on every PR.
- Avoid committing state files, keys, or credentials.

## Terraform Practices

- Use environment-specific tfvars overlays.
- Keep module inputs explicit and documented.
- Prefer optional toggles over breaking changes.
- Add outputs only when they are stable and useful.

## Release Discipline

- Merge to `main` through PRs only.
- Tag releases from validated `main`.
- Update `CHANGELOG.md` and `releases/` for every tag.
- Keep patch releases small and low risk.
