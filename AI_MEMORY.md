# AI Memory

This file captures the stable decisions for this repository so future sessions can recover context quickly.

## Repository Identity

- Public open-source Terraform AWS module library.
- Repository: `gad0788/terraform-aws-modules-mythos`
- First release tag: `v1.0.0`

## Release Model

- Use semantic versioning.
- `major` for breaking changes.
- `minor` for backward-compatible feature additions.
- `patch` for bug fixes, docs, and safe updates.
- Keep release notes under `releases/`.
- Keep `CHANGELOG.md` current.

## Contribution Model

- Do not push directly to `main`.
- All changes should go through pull requests.
- `main` should be protected.
- `CODEOWNERS` is enabled for review routing.
- `CONTRIBUTING.md` defines PR and release flow.

## Security Model

- Keep the repo secret-free.
- Do not commit credentials, tokens, private keys, or tfstate files.
- Use `SECURITY.md` as the contributor policy.
- Checkov and Gitleaks are part of PR validation.
- Dependabot is enabled for dependency maintenance.

## CI and Release Automation

- `Terraform CI` runs formatting, validation, and secret scanning.
- `Checkov` scans Terraform IaC misconfigurations.
- `Terraform Docs` validates docs drift.
- `Terraform Plan` runs PR plan checks when AWS credentials are available.
- `Release` workflow publishes tags and GitHub releases from `main`.

## Consumer Pattern

- External consumers should pin module usage to a release tag, not `main`.
- `demo-app/` is the consumer template.
- `environments/` contains dev and prod tfvars overlays.
- `docs/architecture.md` explains the flow.

## Notes For Future AIs

- Prefer updating the repo docs and workflows rather than only answering in chat.
- If this file conflicts with live repo state, trust the repo state and update this file.
