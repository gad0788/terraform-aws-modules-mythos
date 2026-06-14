variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
}

variable "retention_in_days" {
  description = "Log retention in days"
  type        = number
  default     = 7
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "alarms" {
  description = "CloudWatch alarms"
  type = list(object({
    name                       = string
    comparison_operator        = string
    evaluation_periods         = number
    metric_name               = string
    namespace                 = string
    period                    = number
    statistic                 = string
    threshold                 = number
    alarm_description         = string
    alarm_actions             = list(string)
    ok_actions                = list(string)
    insufficient_data_actions = list(string)
  }))
  default = []
}

variable "create_dashboard" {
  description = "Create CloudWatch dashboard"
  type        = bool
  default     = false
}

variable "dashboard_name" {
  description = "Dashboard name"
  type        = string
  default     = null
}

variable "dashboard_widgets" {
  description = "Dashboard widgets"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
