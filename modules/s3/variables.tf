variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "block_public_access" {
  description = "Block all public access"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Enable S3 logging"
  type        = bool
  default     = false
}

variable "log_bucket" {
  description = "Bucket for storing access logs"
  type        = string
  default     = null
}

variable "log_prefix" {
  description = "Prefix for log objects"
  type        = string
  default     = "logs/"
}

variable "lifecycle_rules" {
  description = "Lifecycle rules for bucket"
  type = list(object({
    id                                = string
    status                            = string
    expiration                        = optional(object({ days = number }))
    noncurrent_version_expiration     = optional(object({ noncurrent_days = number }))
  }))
  default = null
}

variable "cors_rules" {
  description = "CORS rules for bucket"
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
