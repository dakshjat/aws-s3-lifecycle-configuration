

variable "description" {
  type        = string
  description = "The description of the key"  
  default     = null
}

variable "deletion_window_in_days" {
  type        = number
  description = "AWS KMS deletion waiting period"  
  default     = null
}

variable "policy" {
  type        = string
  description = "A valid policy JSON document"  
  default     = null
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the resource"  
  default     = {}
}

variable "enable_key_rotation" {
  type        = bool
  description = "Specifies whether key rotation is enabled"  
  default     = null
}
