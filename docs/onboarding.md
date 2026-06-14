# External Onboarding

This guide is for teams that want to consume this repository as a Terraform module release.

## What To Use

- Pin to a release tag like `v1.0.0`.
- Use `demo-app/` as the starting template.
- Keep environment-specific values in `terraform.tfvars` overlays.

## First Five Minutes

1. Clone or fork the repository.
2. Read `README.md` and `docs/architecture.md`.
3. Copy `demo-app/` into your consumer project or reference the release tag directly.
4. Set your `aws_region`, `environment`, and network values.
5. Run `terraform init`, `terraform plan`, and `terraform apply` with the right tfvars file.

## Minimum Inputs To Review

- `aws_region`
- `environment`
- `project_name`
- `vpc_cidr`
- `public_subnet_cidrs`
- `private_subnet_cidrs`
- `availability_zones`
- `enable_nat_gateway`
- `ec2_instance_type`
- `ec2_instance_count`

## Consumer Rules

- Never point production at `main`.
- Never commit real secrets or credentials.
- Keep the release tag fixed until you have validated the next version.
- Use the release notes to understand what changed.

## If You Need Help

- Read `docs/repo-settings.md` for enterprise settings.
- Read `docs/release-playbook.md` for release behavior.
- Read `CONTRIBUTING.md` if you plan to send changes back upstream.
