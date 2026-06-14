variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "mythos"
}

# ===== VPC Variables =====
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
  default     = true
}

variable "create_vpc" {
  description = "Create VPC"
  type        = bool
  default     = true
}

# ===== EC2 Variables =====
variable "create_ec2" {
  description = "Create EC2 instances"
  type        = bool
  default     = false
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "ec2_key_name" {
  description = "EC2 key name"
  type        = string
  default     = null
}

variable "ec2_enable_encryption" {
  description = "Enable EC2 EBS encryption"
  type        = bool
  default     = true
}

# ===== EKS Variables =====
variable "create_eks" {
  description = "Create EKS cluster"
  type        = bool
  default     = false
}

variable "eks_desired_size" {
  description = "EKS desired node count"
  type        = number
  default     = 2
}

variable "eks_min_size" {
  description = "EKS minimum node count"
  type        = number
  default     = 1
}

variable "eks_max_size" {
  description = "EKS maximum node count"
  type        = number
  default     = 5
}

variable "eks_instance_types" {
  description = "EKS instance types"
  type        = list(string)
  default     = ["t3.medium"]
}

# ===== S3 Variables =====
variable "create_s3" {
  description = "Create S3 bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = null
}

variable "s3_enable_versioning" {
  description = "Enable S3 versioning"
  type        = bool
  default     = true
}

variable "s3_block_public_access" {
  description = "Block public access to S3"
  type        = bool
  default     = true
}

variable "s3_enable_logging" {
  description = "Enable S3 logging"
  type        = bool
  default     = false
}

# ===== RDS Variables =====
variable "create_rds" {
  description = "Create RDS instance"
  type        = bool
  default     = false
}

variable "rds_instance_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "mydb"
}

variable "rds_engine" {
  description = "RDS engine"
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "RDS engine version"
  type        = string
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "RDS allocated storage"
  type        = number
  default     = 20
}

variable "rds_master_username" {
  description = "RDS master username"
  type        = string
  default     = "admin"
}

variable "rds_master_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
  default     = null
}

variable "rds_multi_az" {
  description = "RDS multi-AZ"
  type        = bool
  default     = false
}

# ===== IAM Variables =====
variable "create_iam" {
  description = "Create IAM resources"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
  default     = "mythos-role"
}

variable "iam_assume_role_policy_principals" {
  description = "IAM assume role policy principals"
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
}

variable "iam_managed_policy_arns" {
  description = "IAM managed policy ARNs"
  type        = list(string)
  default     = []
}

variable "iam_create_instance_profile" {
  description = "Create IAM instance profile"
  type        = bool
  default     = false
}

# ===== Secrets Manager Variables =====
variable "create_secrets" {
  description = "Create Secrets Manager secret"
  type        = bool
  default     = false
}

variable "secret_name" {
  description = "Secret name"
  type        = string
  default     = null
}

variable "secret_json" {
  description = "Secret JSON"
  type        = map(string)
  default     = {}
  sensitive   = true
}

# ===== Key Pair Variables =====
variable "create_keypair" {
  description = "Create EC2 key pair"
  type        = bool
  default     = false
}

variable "keypair_name" {
  description = "Key pair name"
  type        = string
  default     = "mythos-key"
}

variable "keypair_generate" {
  description = "Generate key pair"
  type        = bool
  default     = true
}

variable "keypair_private_key_path" {
  description = "Private key path"
  type        = string
  default     = "."
}

# ===== EFS Variables =====
variable "create_efs" {
  description = "Create EFS"
  type        = bool
  default     = false
}

# ===== EBS Variables =====
variable "create_ebs" {
  description = "Create EBS volume"
  type        = bool
  default     = false
}

variable "ebs_availability_zone" {
  description = "EBS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "ebs_size" {
  description = "EBS volume size"
  type        = number
  default     = 100
}

variable "ebs_volume_name" {
  description = "EBS volume name"
  type        = string
  default     = "mythos-volume"
}

# ===== ALB Variables =====
variable "create_alb" {
  description = "Create ALB"
  type        = bool
  default     = false
}

variable "alb_name" {
  description = "ALB name"
  type        = string
  default     = "mythos-alb"
}

variable "alb_target_group_name" {
  description = "ALB target group name"
  type        = string
  default     = "mythos-tg"
}

# ===== NLB Variables =====
variable "create_nlb" {
  description = "Create NLB"
  type        = bool
  default     = false
}

variable "nlb_name" {
  description = "NLB name"
  type        = string
  default     = "mythos-nlb"
}

variable "nlb_target_group_name" {
  description = "NLB target group name"
  type        = string
  default     = "mythos-nlb-tg"
}

# ===== Route53 Variables =====
variable "create_route53" {
  description = "Create Route53 hosted zone"
  type        = bool
  default     = false
}

variable "route53_zone_name" {
  description = "Route53 zone name"
  type        = string
  default     = null
}

variable "route53_private_zone" {
  description = "Route53 private zone"
  type        = bool
  default     = false
}

# ===== CloudFront Variables =====
variable "create_cloudfront" {
  description = "Create CloudFront distribution"
  type        = bool
  default     = false
}

variable "cloudfront_origin_domain" {
  description = "CloudFront origin domain"
  type        = string
  default     = null
}

variable "cloudfront_origin_id" {
  description = "CloudFront origin ID"
  type        = string
  default     = "myOrigin"
}

# ===== WAF Variables =====
variable "create_waf" {
  description = "Create WAF"
  type        = bool
  default     = false
}

variable "waf_scope" {
  description = "WAF scope"
  type        = string
  default     = "REGIONAL"
}

variable "waf_rules" {
  description = "WAF rules"
  type = list(object({
    name       = string
    priority   = number
    rate_limit = number
  }))
  default = []
}

# ===== Lambda Variables =====
variable "create_lambda" {
  description = "Create Lambda function"
  type        = bool
  default     = false
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "mythos-function"
}

variable "lambda_filename" {
  description = "Lambda function filename"
  type        = string
  default     = "lambda.zip"
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.11"
}

# ===== Auto Scaling Variables =====
variable "create_autoscaling" {
  description = "Create Auto Scaling group"
  type        = bool
  default     = false
}

variable "autoscaling_image_id" {
  description = "Auto Scaling image ID"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "autoscaling_instance_type" {
  description = "Auto Scaling instance type"
  type        = string
  default     = "t3.micro"
}

variable "autoscaling_desired_capacity" {
  description = "Auto Scaling desired capacity"
  type        = number
  default     = 2
}

# ===== Batch Variables =====
variable "create_batch" {
  description = "Create Batch"
  type        = bool
  default     = false
}

variable "batch_container_image" {
  description = "Batch container image"
  type        = string
  default     = "busybox"
}

# ===== ElastiCache Variables =====
variable "create_elasticache" {
  description = "Create ElastiCache"
  type        = bool
  default     = false
}

variable "elasticache_cluster_id" {
  description = "ElastiCache cluster ID"
  type        = string
  default     = "mythos-cache"
}

# ===== DynamoDB Variables =====
variable "create_dynamodb" {
  description = "Create DynamoDB table"
  type        = bool
  default     = false
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "mythos-table"
}

variable "dynamodb_hash_key" {
  description = "DynamoDB hash key"
  type        = string
  default     = "id"
}

variable "dynamodb_attributes" {
  description = "DynamoDB attributes"
  type = list(object({
    name = string
    type = string
  }))
  default = [
    { name = "id", type = "S" }
  ]
}

# ===== OpenSearch Variables =====
variable "create_opensearch" {
  description = "Create OpenSearch domain"
  type        = bool
  default     = false
}

variable "opensearch_domain_name" {
  description = "OpenSearch domain name"
  type        = string
  default     = "mythos-opensearch"
}

# ===== CloudWatch Variables =====
variable "create_cloudwatch" {
  description = "Create CloudWatch log group"
  type        = bool
  default     = false
}

variable "cloudwatch_log_group_name" {
  description = "CloudWatch log group name"
  type        = string
  default     = "/aws/mythos/logs"
}

variable "cloudwatch_retention_days" {
  description = "CloudWatch retention days"
  type        = number
  default     = 7
}

# ===== CloudTrail Variables =====
variable "create_cloudtrail" {
  description = "Create CloudTrail"
  type        = bool
  default     = false
}

variable "cloudtrail_name" {
  description = "CloudTrail name"
  type        = string
  default     = "mythos-trail"
}

variable "cloudtrail_bucket_name" {
  description = "CloudTrail S3 bucket name"
  type        = string
  default     = null
}

# ===== X-Ray Variables =====
variable "create_xray" {
  description = "Create X-Ray group"
  type        = bool
  default     = false
}

variable "xray_group_name" {
  description = "X-Ray group name"
  type        = string
  default     = "mythos-group"
}

variable "xray_filter_expression" {
  description = "X-Ray filter expression"
  type        = string
  default     = "service(\"*\")"
}

# ===== ECR Variables =====
variable "create_ecr" {
  description = "Create ECR repository"
  type        = bool
  default     = false
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "mythos-repo"
}

variable "ecr_scan_on_push" {
  description = "ECR scan on push"
  type        = bool
  default     = true
}

# ===== KMS Variables =====
variable "create_kms" {
  description = "Create KMS key"
  type        = bool
  default     = false
}

variable "kms_key_name" {
  description = "KMS key name"
  type        = string
  default     = "mythos-key"
}

variable "kms_enable_key_rotation" {
  description = "Enable KMS key rotation"
  type        = bool
  default     = true
}

# ===== ACM Variables =====
variable "create_acm" {
  description = "Create ACM certificate"
  type        = bool
  default     = false
}

variable "acm_domain_name" {
  description = "ACM domain name"
  type        = string
  default     = null
}

variable "acm_subject_alternative_names" {
  description = "ACM subject alternative names"
  type        = list(string)
  default     = []
}

# ===== AWS Config Variables =====
variable "create_config" {
  description = "Create AWS Config"
  type        = bool
  default     = false
}

variable "config_bucket_name" {
  description = "Config S3 bucket name"
  type        = string
  default     = "mythos-config-bucket"
}

variable "config_rules" {
  description = "Config rules"
  type = list(object({
    name                      = string
    description               = string
    source_identifier         = string
    compliance_resource_types = list(string)
  }))
  default = []
}

# ===== SNS Variables =====
variable "create_sns" {
  description = "Create SNS topic"
  type        = bool
  default     = false
}

variable "sns_topic_name" {
  description = "SNS topic name"
  type        = string
  default     = "mythos-topic"
}

variable "sns_subscriptions" {
  description = "SNS subscriptions"
  type = list(object({
    protocol = string
    endpoint = string
  }))
  default = []
}

# ===== SQS Variables =====
variable "create_sqs" {
  description = "Create SQS queue"
  type        = bool
  default     = false
}

variable "sqs_queue_name" {
  description = "SQS queue name"
  type        = string
  default     = "mythos-queue"
}

variable "sqs_create_dlq" {
  description = "Create SQS dead letter queue"
  type        = bool
  default     = false
}

# ===== EventBridge Variables =====
variable "create_eventbridge" {
  description = "Create EventBridge rule"
  type        = bool
  default     = false
}

variable "eventbridge_rules" {
  description = "EventBridge rules"
  type = list(object({
    name                = string
    description         = string
    event_pattern       = optional(string)
    schedule_expression = optional(string)
  }))
  default = []
}

variable "eventbridge_targets" {
  description = "EventBridge targets"
  type = list(object({
    rule_index        = number
    target_id         = string
    arn               = string
    role_arn          = string
    input             = optional(string)
    input_transformer = optional(any)
  }))
  default = []
}

# ===== Step Functions Variables =====
variable "create_stepfunctions" {
  description = "Create Step Functions state machine"
  type        = bool
  default     = false
}

variable "stepfunctions_state_machine_name" {
  description = "Step Functions state machine name"
  type        = string
  default     = "mythos-state-machine"
}

variable "stepfunctions_definition" {
  description = "Step Functions definition"
  type        = string
  default     = "{}"
}

# ===== AWS Backup Variables =====
variable "create_backup" {
  description = "Create AWS Backup"
  type        = bool
  default     = false
}

variable "backup_vault_name" {
  description = "Backup vault name"
  type        = string
  default     = "mythos-vault"
}

variable "backup_plan_name" {
  description = "Backup plan name"
  type        = string
  default     = "mythos-plan"
}

variable "backup_rule_name" {
  description = "Backup rule name"
  type        = string
  default     = "mythos-rule"
}

# ===== DataSync Variables =====
variable "create_datasync" {
  description = "Create DataSync"
  type        = bool
  default     = false
}

variable "datasync_create_s3_location" {
  description = "Create DataSync S3 location"
  type        = bool
  default     = false
}

variable "datasync_s3_bucket_arn" {
  description = "DataSync S3 bucket ARN"
  type        = string
  default     = null
}
