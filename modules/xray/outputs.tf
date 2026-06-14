output "group_arn" {
  description = "X-Ray group ARN"
  value       = aws_xray_group.main.arn
}

output "sampling_rule_arn" {
  description = "Sampling rule ARN"
  value       = try(aws_xray_sampling_rule.main[0].arn, null)
}
