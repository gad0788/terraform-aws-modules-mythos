variable "key_name" {
  description = "KMS key name"
  type        = string
}

variable "description" {
  description = "KMS key description"
  type        = string
  default     = null
}

variable "deletion_window_in_days" {
  description = "Deletion window in days"
  type        = number
  default     = 10
}

variable "enable_key_rotation" {
  description = "Enable key rotation"
  type        = bool
  default     = true
}

variable "create_key_policy" {
  description = "Create custom key policy"
  type        = bool
  default     = false
}

variable "key_policy" {
  description = "Key policy JSON"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
