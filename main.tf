terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.50"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "Terraform"
    }
  }
}

locals {
  vpc_id                 = try(module.vpc[0].vpc_id, null)
  vpc_public_subnet_ids  = try(module.vpc[0].public_subnet_ids, [])
  vpc_private_subnet_ids = try(module.vpc[0].private_subnet_ids, [])
}

# ===== VPC =====
module "vpc" {
  count  = var.create_vpc ? 1 : 0
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  enable_nat_gateway   = var.enable_nat_gateway
  environment          = var.environment
}

# ===== EC2 =====
module "ec2" {
  count  = var.create_vpc && var.create_ec2 ? 1 : 0
  source = "./modules/ec2"

  vpc_id            = local.vpc_id
  subnet_ids        = local.vpc_public_subnet_ids
  instance_type     = var.ec2_instance_type
  instance_count    = var.ec2_instance_count
  key_name          = var.ec2_key_name
  enable_encryption = var.ec2_enable_encryption
  environment       = var.environment

  depends_on = [module.vpc]
}

# ===== EKS =====
module "eks" {
  count  = var.create_vpc && var.create_eks ? 1 : 0
  source = "./modules/eks"

  vpc_id         = local.vpc_id
  subnet_ids     = local.vpc_private_subnet_ids
  desired_size   = var.eks_desired_size
  min_size       = var.eks_min_size
  max_size       = var.eks_max_size
  instance_types = var.eks_instance_types
  environment    = var.environment

  depends_on = [module.vpc]
}

# ===== S3 =====
module "s3" {
  count  = var.create_s3 ? 1 : 0
  source = "./modules/s3"

  bucket_name         = var.s3_bucket_name
  enable_versioning   = var.s3_enable_versioning
  block_public_access = var.s3_block_public_access
  enable_logging      = var.s3_enable_logging
}

# ===== RDS =====
module "rds" {
  count  = var.create_vpc && var.create_rds ? 1 : 0
  source = "./modules/rds"

  vpc_id                 = local.vpc_id
  subnet_ids             = local.vpc_private_subnet_ids
  db_instance_identifier = var.rds_instance_identifier
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  allocated_storage      = var.rds_allocated_storage
  master_username        = var.rds_master_username
  master_password        = var.rds_master_password
  multi_az               = var.rds_multi_az
  environment            = var.environment

  depends_on = [module.vpc]
}

# ===== IAM =====
module "iam" {
  count  = var.create_iam ? 1 : 0
  source = "./modules/iam"

  role_name                     = var.iam_role_name
  assume_role_policy_principals = var.iam_assume_role_policy_principals
  managed_policy_arns           = var.iam_managed_policy_arns
  create_instance_profile       = var.iam_create_instance_profile
}

# ===== Secrets Manager =====
module "secrets" {
  count  = var.create_secrets ? 1 : 0
  source = "./modules/secrets"

  secret_name = var.secret_name
  secret_json = var.secret_json
}

# ===== Key Pair =====
module "keypair" {
  count  = var.create_keypair ? 1 : 0
  source = "./modules/keypair"

  key_name          = var.keypair_name
  generate_key_pair = var.keypair_generate
  private_key_path  = var.keypair_private_key_path
}

# ===== EFS =====
module "efs" {
  count  = var.create_vpc && var.create_efs ? 1 : 0
  source = "./modules/efs"

  vpc_id      = local.vpc_id
  subnet_ids  = local.vpc_private_subnet_ids
  environment = var.environment

  depends_on = [module.vpc]
}

# ===== EBS =====
module "ebs" {
  count  = var.create_ebs ? 1 : 0
  source = "./modules/ebs"

  availability_zone = var.ebs_availability_zone
  size              = var.ebs_size
  volume_name       = var.ebs_volume_name
}

# ===== ALB =====
module "alb" {
  count  = var.create_vpc && var.create_alb ? 1 : 0
  source = "./modules/alb"

  vpc_id              = local.vpc_id
  subnet_ids          = local.vpc_public_subnet_ids
  load_balancer_name  = var.alb_name
  target_group_name   = var.alb_target_group_name
  target_instance_ids = try(module.ec2[0].instance_ids, [])
  environment         = var.environment

  depends_on = [module.vpc, module.ec2]
}

# ===== NLB =====
module "nlb" {
  count  = var.create_vpc && var.create_nlb ? 1 : 0
  source = "./modules/nlb"

  vpc_id             = local.vpc_id
  subnet_ids         = local.vpc_public_subnet_ids
  load_balancer_name = var.nlb_name
  target_group_name  = var.nlb_target_group_name
  environment        = var.environment

  depends_on = [module.vpc]
}

# ===== Route53 =====
module "route53" {
  count  = var.create_route53 ? 1 : 0
  source = "./modules/route53"

  zone_name    = var.route53_zone_name
  private_zone = var.route53_private_zone
}

# ===== CloudFront =====
module "cloudfront" {
  count  = var.create_cloudfront ? 1 : 0
  source = "./modules/cloudfront"

  origin_domain_name = var.cloudfront_origin_domain
  origin_id          = var.cloudfront_origin_id
  environment        = var.environment
}

# ===== WAF =====
module "waf" {
  count  = var.create_vpc && var.create_alb && var.create_waf ? 1 : 0
  source = "./modules/waf"

  scope        = var.waf_scope
  rules        = var.waf_rules
  resource_arn = try(module.alb[0].load_balancer_arn, null)
  environment  = var.environment
}

# ===== Lambda =====
module "lambda" {
  count  = var.create_lambda ? 1 : 0
  source = "./modules/lambda"

  function_name    = var.lambda_function_name
  filename         = var.lambda_filename
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  source_code_hash = filebase64sha256(var.lambda_filename)
}

# ===== Auto Scaling =====
module "autoscaling" {
  count  = var.create_vpc && var.create_autoscaling ? 1 : 0
  source = "./modules/autoscaling"

  image_id         = var.autoscaling_image_id
  instance_type    = var.autoscaling_instance_type
  subnet_ids       = local.vpc_private_subnet_ids
  desired_capacity = var.autoscaling_desired_capacity
  environment      = var.environment

  depends_on = [module.vpc]
}

# ===== Batch =====
module "batch" {
  count  = var.create_vpc && var.create_batch ? 1 : 0
  source = "./modules/batch"

  subnet_ids      = local.vpc_private_subnet_ids
  container_image = var.batch_container_image
  environment     = var.environment

  depends_on = [module.vpc]
}

# ===== ElastiCache =====
module "elasticache" {
  count  = var.create_vpc && var.create_elasticache ? 1 : 0
  source = "./modules/elasticache"

  vpc_id     = local.vpc_id
  cluster_id = var.elasticache_cluster_id
  subnet_ids = local.vpc_private_subnet_ids
}

# ===== DynamoDB =====
module "dynamodb" {
  count  = var.create_dynamodb ? 1 : 0
  source = "./modules/dynamodb"

  table_name = var.dynamodb_table_name
  hash_key   = var.dynamodb_hash_key
  attributes = var.dynamodb_attributes
}

# ===== OpenSearch =====
module "opensearch" {
  count  = var.create_vpc && var.create_opensearch ? 1 : 0
  source = "./modules/opensearch"

  vpc_id      = local.vpc_id
  domain_name = var.opensearch_domain_name
  subnet_ids  = local.vpc_private_subnet_ids
}

# ===== CloudWatch =====
module "cloudwatch" {
  count  = var.create_cloudwatch ? 1 : 0
  source = "./modules/cloudwatch"

  log_group_name    = var.cloudwatch_log_group_name
  retention_in_days = var.cloudwatch_retention_days
}

# ===== CloudTrail =====
module "cloudtrail" {
  count  = var.create_cloudtrail ? 1 : 0
  source = "./modules/cloudtrail"

  trail_name     = var.cloudtrail_name
  s3_bucket_name = var.cloudtrail_bucket_name
}

# ===== X-Ray =====
module "xray" {
  count  = var.create_xray ? 1 : 0
  source = "./modules/xray"

  group_name        = var.xray_group_name
  filter_expression = var.xray_filter_expression
}

# ===== ECR =====
module "ecr" {
  count  = var.create_ecr ? 1 : 0
  source = "./modules/ecr"

  repository_name = var.ecr_repository_name
  scan_on_push    = var.ecr_scan_on_push
}

# ===== KMS =====
module "kms" {
  count  = var.create_kms ? 1 : 0
  source = "./modules/kms"

  key_name            = var.kms_key_name
  enable_key_rotation = var.kms_enable_key_rotation
}

# ===== ACM =====
module "acm" {
  count  = var.create_acm ? 1 : 0
  source = "./modules/acm"

  domain_name               = var.acm_domain_name
  subject_alternative_names = var.acm_subject_alternative_names
}

# ===== AWS Config =====
module "config" {
  count  = var.create_config ? 1 : 0
  source = "./modules/config"

  environment        = var.environment
  config_bucket_name = var.config_bucket_name
  config_rules       = var.config_rules
}

# ===== SNS =====
module "sns" {
  count  = var.create_sns ? 1 : 0
  source = "./modules/sns"

  topic_name    = var.sns_topic_name
  subscriptions = var.sns_subscriptions
}

# ===== SQS =====
module "sqs" {
  count  = var.create_sqs ? 1 : 0
  source = "./modules/sqs"

  queue_name = var.sqs_queue_name
  create_dlq = var.sqs_create_dlq
}

# ===== EventBridge =====
module "eventbridge" {
  count  = var.create_eventbridge ? 1 : 0
  source = "./modules/eventbridge"

  rules   = var.eventbridge_rules
  targets = var.eventbridge_targets
}

# ===== Step Functions =====
module "stepfunctions" {
  count  = var.create_stepfunctions ? 1 : 0
  source = "./modules/stepfunctions"

  state_machine_name = var.stepfunctions_state_machine_name
  definition         = var.stepfunctions_definition
}

# ===== AWS Backup =====
module "backup" {
  count  = var.create_backup ? 1 : 0
  source = "./modules/backup"

  vault_name = var.backup_vault_name
  plan_name  = var.backup_plan_name
  rule_name  = var.backup_rule_name
}

# ===== DataSync =====
module "datasync" {
  count  = var.create_datasync ? 1 : 0
  source = "./modules/datasync"

  create_s3_location = var.datasync_create_s3_location
  s3_bucket_arn      = var.datasync_s3_bucket_arn
}
