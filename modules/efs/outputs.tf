output "file_system_id" {
  description = "EFS file system ID"
  value       = aws_efs_file_system.main.id
}

output "file_system_arn" {
  description = "EFS file system ARN"
  value       = aws_efs_file_system.main.arn
}

output "mount_target_ids" {
  description = "IDs of EFS mount targets"
  value       = aws_efs_mount_target.main[*].id
}

output "access_point_id" {
  description = "EFS access point ID"
  value       = try(aws_efs_access_point.main[0].id, null)
}

output "access_point_arn" {
  description = "EFS access point ARN"
  value       = try(aws_efs_access_point.main[0].arn, null)
}

output "security_group_id" {
  description = "Security group ID for EFS"
  value       = aws_security_group.efs.id
}
