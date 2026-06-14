# Shared defaults for all environments.
# Use an environment file with:
#   terraform plan -var-file="environments/dev/terraform.tfvars"
#   terraform plan -var-file="environments/prod/terraform.tfvars"

aws_region = "us-east-1"
project_name = "mythos"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones    = ["us-east-1a", "us-east-1b"]
enable_nat_gateway    = true
create_vpc            = true

# Module toggles default to off here.
create_ec2           = false
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
