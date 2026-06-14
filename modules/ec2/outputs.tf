output "instance_ids" {
  description = "IDs of launched EC2 instances"
  value       = aws_instance.main[*].id
}

output "instance_private_ips" {
  description = "Private IP addresses of instances"
  value       = aws_instance.main[*].private_ip
}

output "instance_public_ips" {
  description = "Public IP addresses of instances"
  value       = aws_instance.main[*].public_ip
}

output "security_group_id" {
  description = "Security group ID for EC2 instances"
  value       = aws_security_group.ec2.id
}

output "ebs_volume_ids" {
  description = "IDs of attached EBS volumes"
  value       = aws_ebs_volume.extra[*].id
}
