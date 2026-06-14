resource "aws_s3_bucket" "log_bucket" {
  count  = var.enable_logging ? 1 : 0
  bucket = "${var.environment}-cloudfront-logs"

  tags = merge(var.tags, {
    Name = "${var.environment}-cloudfront-logs"
  })
}

resource "aws_cloudfront_distribution" "main" {
  enabled = var.enabled

  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.origin_id
  }

  default_cache_behavior {
    allowed_methods        = var.allowed_methods
    cached_methods        = var.cached_methods
    target_origin_id      = var.origin_id
    compress              = var.compress
    viewer_protocol_policy = var.viewer_protocol_policy

    forwarded_values {
      query_string = var.query_string_cache_enabled
      cookies {
        forward = var.cookie_forward
      }
    }

    min_ttl     = var.min_ttl
    default_ttl = var.default_ttl
    max_ttl     = var.max_ttl
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
      locations        = var.geo_restriction_locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = !var.use_acm_certificate
    acm_certificate_arn            = var.use_acm_certificate ? var.acm_certificate_arn : null
    ssl_support_method             = var.use_acm_certificate ? "sni-only" : null
    minimum_protocol_version       = var.use_acm_certificate ? "TLSv1.2_2021" : null
  }

  logging_config {
    include_cookies = var.enable_logging ? true : false
    bucket          = var.enable_logging ? aws_s3_bucket.log_bucket[0].bucket_domain_name : null
    prefix          = var.enable_logging ? var.log_prefix : null
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-cloudfront"
  })
}
