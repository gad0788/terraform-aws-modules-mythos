output "configuration_recorder_id" {
  description = "Configuration recorder ID"
  value       = aws_config_configuration_recorder.main.id
}

output "delivery_channel_id" {
  description = "Delivery channel ID"
  value       = aws_config_delivery_channel.main.id
}

output "config_rule_arns" {
  description = "Config rule ARNs"
  value       = aws_config_config_rule.main[*].arn
}
