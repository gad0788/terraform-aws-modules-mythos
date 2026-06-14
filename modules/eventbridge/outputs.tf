output "event_bus_arn" {
  description = "Event bus ARN"
  value       = try(aws_cloudwatch_event_bus.main[0].arn, "default")
}

output "rule_arns" {
  description = "Rule ARNs"
  value       = aws_cloudwatch_event_rule.main[*].arn
}
