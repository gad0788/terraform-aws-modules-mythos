output "vpc_id" {
  description = "VPC ID"
  value       = try(module.infra.vpc_id, null)
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = try(module.infra.public_subnet_ids, [])
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = try(module.infra.private_subnet_ids, [])
}

output "ec2_instance_ids" {
  description = "EC2 instance IDs"
  value       = try(module.infra.ec2_instance_ids, null)
}
