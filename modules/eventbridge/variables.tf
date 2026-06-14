variable "event_bus_name" {
  description = "Event bus name"
  type        = string
  default     = "default"
}

variable "create_event_bus" {
  description = "Create custom event bus"
  type        = bool
  default     = false
}

variable "rules" {
  description = "EventBridge rules"
  type = list(object({
    name                = string
    description         = string
    event_pattern       = optional(string)
    schedule_expression = optional(string)
  }))
  default = []
}

variable "targets" {
  description = "EventBridge targets"
  type = list(object({
    rule_index         = number
    target_id          = string
    arn                = string
    role_arn           = string
    input              = optional(string)
    input_transformer  = optional(any)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
