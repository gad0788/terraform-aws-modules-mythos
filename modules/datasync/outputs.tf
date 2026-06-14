output "s3_location_arn" {
  description = "S3 location ARN"
  value       = try(aws_datasync_location_s3.main[0].arn, null)
}

output "efs_location_arn" {
  description = "EFS location ARN"
  value       = try(aws_datasync_location_efs.main[0].arn, null)
}

output "task_arn" {
  description = "Task ARN"
  value       = try(aws_datasync_task.main[0].arn, null)
}

output "task_id" {
  description = "Task ID"
  value       = try(aws_datasync_task.main[0].id, null)
}
