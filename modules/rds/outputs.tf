output "db_instance_id" {
  description = "Database instance ID"
  value       = aws_db_instance.main.id
}

output "db_instance_endpoint" {
  description = "Database instance endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_instance_address" {
  description = "Database instance address"
  value       = aws_db_instance.main.address
}

output "db_instance_port" {
  description = "Database instance port"
  value       = aws_db_instance.main.port
}

output "db_instance_resource_id" {
  description = "Database instance resource ID"
  value       = aws_db_instance.main.resource_id
}

output "db_security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.rds.id
}

output "db_subnet_group_id" {
  description = "Database subnet group ID"
  value       = aws_db_subnet_group.main.id
}
