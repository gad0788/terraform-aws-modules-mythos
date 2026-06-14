variable "scope" {
  description = "Scope (CLOUDFRONT or REGIONAL)"
  type        = string
  default     = "REGIONAL"
}

variable "create_ip_set" {
  description = "Create IP set"
  type        = bool
  default     = false
}

variable "ip_addresses" {
  description = "IP addresses for IP set"
  type        = list(string)
  default     = []
}

variable "rules" {
  description = "WAF rules"
  type = list(object({
    name       = string
    priority   = number
    rate_limit = number
  }))
  default = []
}

variable "resource_arn" {
  description = "Resource ARN to associate WAF"
  type        = string
  default     = null
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
