variable "secret_name" {
  description = "Name of the secret"
  type        = string
}

variable "description" {
  description = "Description of the secret"
  type        = string
  default     = null
}

variable "recovery_window_in_days" {
  description = "Recovery window in days"
  type        = number
  default     = 7
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "secret_string" {
  description = "Secret string value"
  type        = string
  default     = null
  sensitive   = true
}

variable "secret_json" {
  description = "Secret JSON value"
  type        = map(string)
  default     = null
  sensitive   = true
}

variable "enable_rotation" {
  description = "Enable secret rotation"
  type        = bool
  default     = false
}

variable "rotation_days" {
  description = "Rotation days"
  type        = number
  default     = 30
}

variable "rotation_lambda_arn" {
  description = "Lambda function ARN for rotation"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
