output "state_machine_arn" {
  description = "State machine ARN"
  value       = aws_sfn_state_machine.main.arn
}

output "role_arn" {
  description = "Execution role ARN"
  value       = aws_iam_role.sfn.arn
}
