output "log_group_name" {
  description = "Log group name"
  value       = aws_cloudwatch_log_group.main.name
}

output "log_group_arn" {
  description = "Log group ARN"
  value       = aws_cloudwatch_log_group.main.arn
}

output "alarm_arns" {
  description = "Alarm ARNs"
  value       = aws_cloudwatch_metric_alarm.main[*].arn
}

output "dashboard_url" {
  description = "Dashboard URL"
  value       = try(aws_cloudwatch_dashboard.main[0].dashboard_name, null)
}
