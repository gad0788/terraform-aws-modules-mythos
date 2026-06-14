output "vpc_id" {
  description = "VPC ID"
  value       = try(module.vpc[0].vpc_id, null)
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = try(module.vpc[0].public_subnet_ids, [])
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = try(module.vpc[0].private_subnet_ids, [])
}

output "ec2_instance_ids" {
  description = "EC2 instance IDs"
  value       = try(module.ec2[0].instance_ids, null)
}

output "eks_cluster_id" {
  description = "EKS cluster ID"
  value       = try(module.eks[0].cluster_id, null)
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = try(module.rds[0].db_instance_endpoint, null)
}

output "s3_bucket_id" {
  description = "S3 bucket ID"
  value       = try(module.s3[0].bucket_id, null)
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = try(module.alb[0].load_balancer_dns_name, null)
}

output "nlb_dns_name" {
  description = "NLB DNS name"
  value       = try(module.nlb[0].load_balancer_dns_name, null)
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name"
  value       = try(module.cloudfront[0].distribution_domain_name, null)
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = try(module.ecr[0].repository_url, null)
}

output "lambda_function_arn" {
  description = "Lambda function ARN"
  value       = try(module.lambda[0].function_arn, null)
}

output "sns_topic_arn" {
  description = "SNS topic ARN"
  value       = try(module.sns[0].topic_arn, null)
}

output "sqs_queue_url" {
  description = "SQS queue URL"
  value       = try(module.sqs[0].queue_url, null)
}

output "dynamodb_table_name" {
  description = "DynamoDB table name"
  value       = try(module.dynamodb[0].table_name, null)
}

output "elasticache_cluster_address" {
  description = "ElastiCache cluster address"
  value       = try(module.elasticache[0].cluster_address, null)
}

output "kms_key_id" {
  description = "KMS key ID"
  value       = try(module.kms[0].key_id, null)
}
