variable "origin_domain_name" {
  description = "Origin domain name"
  type        = string
}

variable "origin_id" {
  description = "Origin ID"
  type        = string
}

variable "enabled" {
  description = "Enable distribution"
  type        = bool
  default     = true
}

variable "allowed_methods" {
  description = "Allowed HTTP methods"
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "cached_methods" {
  description = "Cached HTTP methods"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "compress" {
  description = "Enable compression"
  type        = bool
  default     = true
}

variable "viewer_protocol_policy" {
  description = "Viewer protocol policy"
  type        = string
  default     = "redirect-to-https"
}

variable "query_string_cache_enabled" {
  description = "Cache by query string"
  type        = bool
  default     = false
}

variable "cookie_forward" {
  description = "Cookie forwarding"
  type        = string
  default     = "none"
}

variable "min_ttl" {
  description = "Minimum TTL"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "Default TTL"
  type        = number
  default     = 86400
}

variable "max_ttl" {
  description = "Maximum TTL"
  type        = number
  default     = 31536000
}

variable "price_class" {
  description = "Price class"
  type        = string
  default     = "PriceClass_100"
}

variable "geo_restriction_type" {
  description = "Geo restriction type"
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "Geo restriction locations"
  type        = list(string)
  default     = []
}

variable "use_acm_certificate" {
  description = "Use ACM certificate"
  type        = bool
  default     = false
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN"
  type        = string
  default     = null
}

variable "enable_logging" {
  description = "Enable logging"
  type        = bool
  default     = false
}

variable "log_prefix" {
  description = "Log prefix"
  type        = string
  default     = "cf-logs/"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
