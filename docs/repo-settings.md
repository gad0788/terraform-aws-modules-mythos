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
- Require conversation resolution before merge.

## Required Checks

Recommended required status checks:

- Terraform CI
- Checkov
- Terraform Docs
- Terraform Plan

Recommended branch protection rules:

- Require status checks before merging.
- Require branches to be up to date before merge.
- Disallow force pushes.
- Disallow branch deletion for `main`.
- Limit merge methods to squash or merge, depending on your preference.

Should Checkov be required before merge?

- Yes. For this repo, Checkov should be a required check because it catches Terraform misconfigurations before they reach `main`.

## Notes

- These settings are not stored in the repository.
- They must be configured in the GitHub UI or by an organization/repository administrator.
