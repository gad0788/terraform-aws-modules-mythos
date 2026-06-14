variable "zone_name" {
  description = "Route53 zone name"
  type        = string
}

variable "private_zone" {
  description = "Private hosted zone"
  type        = bool
  default     = false
}

variable "records" {
  description = "Route53 records"
  type = list(object({
    name                 = string
    type                 = string
    ttl                  = number
    records              = list(string)
    set_identifier       = optional(string)
    failover_routing_policy = optional(string)
  }))
  default = []
}

variable "create_health_check" {
  description = "Create health check"
  type        = bool
  default     = false
}

variable "health_check_type" {
  description = "Health check type"
  type        = string
  default     = "HTTP"
}

variable "health_check_ip_address" {
  description = "Health check IP address"
  type        = string
  default     = null
}

variable "health_check_port" {
  description = "Health check port"
  type        = number
  default     = 80
}

variable "health_check_protocol" {
  description = "Health check protocol"
  type        = string
  default     = "HTTP"
}

variable "health_check_request_interval" {
  description = "Health check request interval"
  type        = number
  default     = 30
}

variable "health_check_failure_threshold" {
  description = "Health check failure threshold"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
