output "domain_id" {
  description = "OpenSearch domain ID"
  value       = aws_opensearch_domain.main.id
}

output "domain_arn" {
  description = "OpenSearch domain ARN"
  value       = aws_opensearch_domain.main.arn
}

output "domain_endpoint" {
  description = "OpenSearch domain endpoint"
  value       = aws_opensearch_domain.main.endpoint
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.opensearch.id
}
