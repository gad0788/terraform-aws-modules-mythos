# Implementation Plan: Versioned Terraform Module Releases and Demo App

## Goal

Turn this repository into a versioned Terraform module library that can be released and consumed by product teams in a predictable way.

The first release will be `v1.0.0`, and the demo app will consume that release with:

- `vpc` enabled
- `ec2` enabled
- all other modules disabled

## Versioning Strategy

Use semantic versioning:

- `MAJOR` version for breaking changes
- `MINOR` version for backwards-compatible feature additions
- `PATCH` version for bug fixes, documentation, and safe internal refactors

Examples:

- `v1.0.0` - first stable release
- `v1.1.0` - add a new optional module or new input variable without breaking compatibility
- `v1.0.1` - fix a bug in an existing module
- `v2.0.0` - change inputs/outputs in a way that breaks consumers

## Release Model

Each release should be created at the module repository level and tagged in git.

Recommended release flow:

1. Merge changes into the release branch or default branch.
2. Run `terraform fmt`, `terraform validate`, and any required tests.
3. Create a git tag such as `v1.0.0`.
4. Publish a release note that lists:
   - added modules or features
   - changed inputs/outputs
   - any breaking changes
   - upgrade notes

## Consumer Model

Product repositories should not point at local module code.

They should reference the released module version directly, for example:

```hcl
module "terraform_modules_mythos" {
  source = "git::https://github.com/<org>/terraform-modules-mythos-5.git?ref=v1.0.0"

  aws_region  = var.aws_region
  environment = var.environment

  create_vpc = true
  create_ec2 = true

  create_eks = false
  create_s3  = false
  create_rds = false
}
```

This gives the consumer:

- a fixed release they can trust
- the ability to upgrade intentionally
- control over which resources are enabled

## Demo App Layout

Create a new folder named `demo-app/` in this repository or in a separate consumer repository.

Recommended structure:

```text
demo-app/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── environments/
│   ├── dev.tfvars
│   └── prod.tfvars
└── README.md
```

## Demo App Behavior

The demo app should:

- consume the module release by tag
- turn on only VPC and EC2
- keep all other module toggles off
- expose common variables at the app layer so teams do not edit module code

Recommended app-level variables:

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
- `ec2_key_name`
- `ec2_enable_encryption`

## Demo App Example

### `main.tf`

```hcl
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "infra" {
  source = "git::https://github.com/<org>/terraform-modules-mythos-5.git?ref=v1.0.0"

  aws_region  = var.aws_region
  environment = var.environment
  project_name = var.project_name

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  enable_nat_gateway   = var.enable_nat_gateway
  create_vpc           = true

  create_ec2            = true
  ec2_instance_type     = var.ec2_instance_type
  ec2_instance_count    = var.ec2_instance_count
  ec2_key_name          = var.ec2_key_name
  ec2_enable_encryption = var.ec2_enable_encryption

  create_eks           = false
  create_s3            = false
  create_rds           = false
  create_iam           = false
  create_secrets       = false
  create_keypair       = false
  create_efs           = false
  create_ebs           = false
  create_alb           = false
  create_nlb           = false
  create_route53       = false
  create_cloudfront    = false
  create_waf           = false
  create_lambda        = false
  create_autoscaling   = false
  create_batch         = false
  create_elasticache   = false
  create_dynamodb      = false
  create_opensearch    = false
  create_cloudwatch    = false
  create_cloudtrail    = false
  create_xray          = false
  create_ecr           = false
  create_kms           = false
  create_acm           = false
  create_config        = false
  create_sns           = false
  create_sqs           = false
  create_eventbridge   = false
  create_stepfunctions = false
  create_backup        = false
  create_datasync      = false
}
```

### `variables.tf`

Expose the app variables only. The module version should own the resource implementation, while the demo app owns the deployment defaults.

### `environments/dev.tfvars`

```hcl
aws_region   = "us-east-1"
environment  = "dev"
project_name = "demo-app"

vpc_cidr             = "10.20.0.0/16"
public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

ec2_instance_type     = "t3.micro"
ec2_instance_count    = 1
ec2_key_name          = null
ec2_enable_encryption = true
```

### `environments/prod.tfvars`

```hcl
aws_region   = "us-east-1"
environment  = "prod"
project_name = "demo-app"

vpc_cidr             = "10.30.0.0/16"
public_subnet_cidrs  = ["10.30.1.0/24", "10.30.2.0/24"]
private_subnet_cidrs = ["10.30.10.0/24", "10.30.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

ec2_instance_type     = "t3.small"
ec2_instance_count    = 2
ec2_key_name          = null
ec2_enable_encryption = true
```

## Maintenance Rules

1. Update module inputs only in a backwards-compatible way whenever possible.
2. Add new optional resources behind new `create_*` flags.
3. Treat release tags as immutable.
4. Record changes in release notes before consumers upgrade.
5. Keep demo apps pinned to a specific release until they are tested against the next one.

## Recommended Next Actions

1. Create the `demo-app/` folder with the files above.
2. Update the module documentation to explain the release/tag workflow.
3. Create the first release tag `v1.0.0`.
4. Point the demo app at `v1.0.0` and run `terraform init`, `plan`, and `apply` in dev.
