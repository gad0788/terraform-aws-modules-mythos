# Changelog

All notable changes to this repository should be documented here.

## [Unreleased]

- Versioning and release workflow introduced
- Demo app scaffold added
- Environment-specific tfvars layout added

## [v1.0.0] - 2026-06-14

### Added

- Initial stable Terraform module release
- VPC and EC2 support for consumer apps
- Optional toggles for additional AWS services
- `demo-app/` consumer template
- `environments/` layout for dev and prod configuration

### Notes

- Demo consumers should pin to `v1.0.0`
- VPC is now a real toggle in the module root

