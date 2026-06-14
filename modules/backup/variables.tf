variable "vault_name" {
  description = "Backup vault name"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN"
  type        = string
  default     = null
}

variable "plan_name" {
  description = "Backup plan name"
  type        = string
}

variable "rule_name" {
  description = "Backup rule name"
  type        = string
}

variable "schedule" {
  description = "Backup schedule (cron expression)"
  type        = string
  default     = "cron(0 2 * * ? *)"
}

variable "delete_after_days" {
  description = "Delete backup after days"
  type        = number
  default     = 30
}

variable "create_vault_policy" {
  description = "Create vault policy"
  type        = bool
  default     = false
}

variable "vault_policy" {
  description = "Vault policy JSON"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
