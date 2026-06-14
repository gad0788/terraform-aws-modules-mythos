# Contributing Guide

This repository is versioned with semantic releases and is intended to stay secret-free.

## Branching

- Create one feature branch per change.
- Keep PRs focused on a single module, fix, or doc update.
- Merge into `main` only after validation passes.

## Local Tooling

- Install `pre-commit` and run `pre-commit install`.
- Use `terraform fmt` before committing.
- Use `terraform-docs` or the pre-commit hook to keep README input/output docs current.
- Run `terraform validate` locally before opening a PR.

## Pull Request Checklist

- [ ] Change is scoped to one purpose
- [ ] Terraform files are formatted with `terraform fmt`
- [ ] Configuration passes `terraform validate`
- [ ] No secrets, tokens, passwords, or private keys were added
- [ ] Public docs were updated if inputs, outputs, or workflows changed
- [ ] Release impact is understood: `patch`, `minor`, or `major`

## Release Checklist

- [ ] Merge the PR into `main`
- [ ] Update `CHANGELOG.md`
- [ ] Add or update the release note under `releases/`
- [ ] Verify the demo app still pins the intended tag
- [ ] Run `terraform fmt`
- [ ] Run `terraform validate`
- [ ] Create the git tag for the release, such as `v1.0.1`

## Release Flow

1. Merge the feature branch into `main`.
2. Run the GitHub Actions `Release` workflow from `main`.
3. Use the matching version note under `releases/`.
4. Publish the release tag and notify consumers.

## Version Rules

- `patch` for bug fixes and docs
- `minor` for backward-compatible additions
- `major` for breaking changes

## Safety Rules

- Do not commit Terraform state files.
- Do not commit generated key material.
- Do not commit real secrets or credentials.
- Use fake values in examples.
