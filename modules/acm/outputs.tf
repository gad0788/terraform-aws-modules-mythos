output "certificate_arn" {
  description = "Certificate ARN"
  value       = aws_acm_certificate.main.arn
}

output "certificate_id" {
  description = "Certificate ID"
  value       = aws_acm_certificate.main.id
}

output "domain_validation_options" {
  description = "Domain validation options"
  value       = aws_acm_certificate.main.domain_validation_options
}
