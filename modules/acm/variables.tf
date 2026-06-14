variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "subject_alternative_names" {
  description = "Subject alternative names"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Validation method"
  type        = string
  default     = "DNS"
}

variable "validate_certificate" {
  description = "Validate certificate"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
