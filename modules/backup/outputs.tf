output "vault_arn" {
  description = "Backup vault ARN"
  value       = aws_backup_vault.main.arn
}

output "plan_arn" {
  description = "Backup plan ARN"
  value       = aws_backup_plan.main.arn
}

output "plan_id" {
  description = "Backup plan ID"
  value       = aws_backup_plan.main.id
}
