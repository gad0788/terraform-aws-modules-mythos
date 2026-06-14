variable "topic_name" {
  description = "SNS topic name"
  type        = string
}

variable "display_name" {
  description = "Display name"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "KMS key ID"
  type        = string
  default     = null
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication"
  type        = bool
  default     = false
}

variable "subscriptions" {
  description = "SNS subscriptions"
  type = list(object({
    protocol = string
    endpoint = string
  }))
  default = []
}

variable "create_topic_policy" {
  description = "Create topic policy"
  type        = bool
  default     = false
}

variable "topic_policy" {
  description = "Topic policy JSON"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
