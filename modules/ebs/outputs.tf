output "volume_id" {
  description = "EBS volume ID"
  value       = aws_ebs_volume.main.id
}

output "volume_arn" {
  description = "EBS volume ARN"
  value       = aws_ebs_volume.main.arn
}

output "attachment_id" {
  description = "Volume attachment ID"
  value       = try(aws_volume_attachment.main[0].id, null)
}

output "snapshot_id" {
  description = "EBS snapshot ID"
  value       = try(aws_ebs_snapshot.main[0].id, null)
}

output "snapshot_arn" {
  description = "EBS snapshot ARN"
  value       = try(aws_ebs_snapshot.main[0].arn, null)
}
