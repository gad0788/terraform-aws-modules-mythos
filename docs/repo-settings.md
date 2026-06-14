# GitHub Repository Settings

Some security controls must be enabled in GitHub settings by a repository owner or admin.

## Recommended Settings

- Enable **Dependabot alerts**.
- Enable **Dependabot security updates** if available.
- Enable **secret scanning**.
- Enable **push protection** for secrets.
- Protect the `main` branch.
- Require the PR checks to pass before merge.
- Require at least one approving review.
- Restrict who can push to `main`.

## Required Checks

Recommended required status checks:

- Terraform CI
- Checkov
- Terraform Docs

Optional but useful:

- Terraform Plan
- Release workflow status before tagging

## Notes

- These settings are not stored in the repository.
- They must be configured in the GitHub UI or by an organization/repository administrator.
