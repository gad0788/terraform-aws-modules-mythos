# Environment Files

Use these files to control what gets deployed in each environment.

## Layout

- `terraform.tfvars`
  - Shared defaults used by every environment.
- `dev/terraform.tfvars`
  - Dev-specific overrides and module toggles.
- `prod/terraform.tfvars`
  - Production-specific overrides and module toggles.

## How To Deploy

From the repository root:

```bash
terraform init
terraform plan -var-file="environments/dev/terraform.tfvars"
terraform apply -var-file="environments/dev/terraform.tfvars"
```

For production:

```bash
terraform plan -var-file="environments/prod/terraform.tfvars"
terraform apply -var-file="environments/prod/terraform.tfvars"
```

## Notes

- `create_vpc` is now a real toggle.
- Most services depend on the VPC, so turn `create_vpc` off only if you also turn off the VPC-dependent modules.
- Keep secrets and environment-specific values out of version control.
