variable "group_name" {
  description = "X-Ray group name"
  type        = string
}

variable "filter_expression" {
  description = "Filter expression"
  type        = string
}

variable "create_sampling_rule" {
  description = "Create sampling rule"
  type        = bool
  default     = false
}

variable "rule_name" {
  description = "Sampling rule name"
  type        = string
  default     = null
}

variable "priority" {
  description = "Priority"
  type        = number
  default     = null
}

variable "rule_version" {
  description = "Sampling rule version"
  type        = number
  default     = 1
}

variable "host" {
  description = "Host"
  type        = string
  default     = "*"
}

variable "http_method" {
  description = "HTTP method"
  type        = string
  default     = "*"
}

variable "url_path" {
  description = "URL path"
  type        = string
  default     = "*"
}

variable "resource_arn" {
  description = "Resource ARN"
  type        = string
  default     = "*"
}

variable "service_name" {
  description = "Service name"
  type        = string
  default     = "*"
}

variable "service_type" {
  description = "Service type"
  type        = string
  default     = "*"
}

variable "fixed_rate" {
  description = "Fixed rate"
  type        = number
  default     = 0.05
}

variable "reservoir_size" {
  description = "Reservoir size"
  type        = number
  default     = 1
}

variable "attributes" {
  description = "Attributes"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
