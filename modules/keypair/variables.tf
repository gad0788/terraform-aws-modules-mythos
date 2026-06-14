variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "generate_key_pair" {
  description = "Generate new key pair"
  type        = bool
  default     = true
}

variable "public_key" {
  description = "Public key (used if generate_key_pair is false)"
  type        = string
  default     = null
}

variable "save_private_key" {
  description = "Save private key to local file"
  type        = bool
  default     = false
}

variable "private_key_path" {
  description = "Path to save private key"
  type        = string
  default     = "."
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
