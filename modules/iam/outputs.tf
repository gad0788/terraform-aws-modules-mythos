output "role_id" {
  description = "IAM role ID"
  value       = aws_iam_role.main.id
}

output "role_arn" {
  description = "IAM role ARN"
  value       = aws_iam_role.main.arn
}

output "role_name" {
  description = "IAM role name"
  value       = aws_iam_role.main.name
}

output "user_id" {
  description = "IAM user ID"
  value       = try(aws_iam_user.main[0].id, null)
}

output "user_arn" {
  description = "IAM user ARN"
  value       = try(aws_iam_user.main[0].arn, null)
}

output "group_id" {
  description = "IAM group ID"
  value       = try(aws_iam_group.main[0].id, null)
}

output "group_arn" {
  description = "IAM group ARN"
  value       = try(aws_iam_group.main[0].arn, null)
}

output "policy_id" {
  description = "IAM policy ID"
  value       = try(aws_iam_policy.main[0].id, null)
}

output "policy_arn" {
  description = "IAM policy ARN"
  value       = try(aws_iam_policy.main[0].arn, null)
}

output "instance_profile_id" {
  description = "Instance profile ID"
  value       = try(aws_iam_instance_profile.main[0].id, null)
}

output "instance_profile_arn" {
  description = "Instance profile ARN"
  value       = try(aws_iam_instance_profile.main[0].arn, null)
}
