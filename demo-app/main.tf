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
