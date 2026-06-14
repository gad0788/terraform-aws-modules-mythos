resource "aws_acm_certificate" "main" {
  domain_name       = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = var.validation_method

  tags = merge(var.tags, {
    Name = var.domain_name
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "main" {
  count           = var.validate_certificate ? 1 : 0
  certificate_arn = aws_acm_certificate.main.arn

  timeouts {
    create = "5m"
  }
}
