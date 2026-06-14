variable "queue_name" {
  description = "SQS queue name"
  type        = string
}

variable "delay_seconds" {
  description = "Delay seconds"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Maximum message size in bytes"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Message retention in seconds"
  type        = number
  default     = 345600
}

variable "receive_wait_time_seconds" {
  description = "Receive wait time in seconds"
  type        = number
  default     = 0
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout in seconds"
  type        = number
  default     = 30
}

variable "kms_key_id" {
  description = "KMS key ID"
  type        = string
  default     = null
}

variable "create_dlq" {
  description = "Create dead letter queue"
  type        = bool
  default     = false
}

variable "max_receive_count" {
  description = "Maximum receive count"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
