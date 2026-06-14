output "secret_id" {
  description = "Secret ID"
  value       = aws_secretsmanager_secret.main.id
}

output "secret_arn" {
  description = "Secret ARN"
  value       = aws_secretsmanager_secret.main.arn
}

output "secret_version_id" {
  description = "Secret version ID"
  value       = try(aws_secretsmanager_secret_version.main[0].version_id, null)
}
