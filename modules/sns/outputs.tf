output "topic_arn" {
  description = "SNS topic ARN"
  value       = aws_sns_topic.main.arn
}

output "topic_id" {
  description = "SNS topic ID"
  value       = aws_sns_topic.main.id
}

output "subscription_arns" {
  description = "SNS subscription ARNs"
  value       = aws_sns_topic_subscription.main[*].arn
}
