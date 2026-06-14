# Branch Protection

Use these rules to keep `main` safe for public open-source maintenance.

## Recommended Rules

- Protect the `main` branch.
- Require pull request reviews before merging.
- Require at least one approving review.
- Require conversation resolution before merge.
- Require status checks to pass before merge.
- Require branches to be up to date before merging.
- Block force pushes.
- Block branch deletion.
- Restrict who can push to matching branches.

## Required Status Checks

Recommended checks for this repo:

- Terraform CI
- Checkov
- Terraform Docs
- Terraform Plan

If you want the strongest gate, require all four before merge.

## Merge Policy

- Prefer squash merge for clean history.
- Keep `main` protected so changes only land through PRs.
- Do not allow direct pushes from contributors.

## Why This Matters

- Prevents accidental direct pushes to the release branch.
- Forces review and automated validation.
- Keeps releases reproducible and easier to audit.
