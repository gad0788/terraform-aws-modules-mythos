# demo-app

This folder is a consumer template for a pinned Terraform module release.

It is designed so app teams can:

- reference a fixed module version
- turn on only the resources they need
- keep environment-specific values in tfvars files
- adjust common values like region and EC2 size without editing the module repo

## Current wiring

The demo app is currently wired to the local module root with:

```hcl
source = ".."
```

When the first release tag exists, replace that with the release source, for example:

```hcl
source = "git::https://github.com/<org>/terraform-modules-mythos-5.git?ref=v1.0.0"
```

## Files

- `main.tf` - Root Terraform entrypoint for the app
- `variables.tf` - App-level input variables
- `outputs.tf` - App-level outputs
- `terraform.tfvars` - Shared defaults
- `environments/dev.tfvars` - Dev deployment values
- `environments/prod.tfvars` - Prod deployment values

## What this template enables

- VPC on
- EC2 on
- everything else off

## Deploy dev

From the `demo-app/` folder:

```bash
terraform init
terraform plan -var-file="terraform.tfvars" -var-file="environments/dev.tfvars"
terraform apply -var-file="terraform.tfvars" -var-file="environments/dev.tfvars"
```

## Deploy prod

From the `demo-app/` folder:

```bash
terraform plan -var-file="terraform.tfvars" -var-file="environments/prod.tfvars"
terraform apply -var-file="terraform.tfvars" -var-file="environments/prod.tfvars"
```

## Common changes

- change `aws_region` per environment
- change `ec2_instance_type` for dev or prod sizing
- change `ec2_instance_count` for scale
- update CIDR ranges if your network plan changes

## Next step

Create release notes and tag the module repository as `v1.0.0`.
