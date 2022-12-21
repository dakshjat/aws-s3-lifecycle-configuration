variable "bucket" {
  type        = string
  description = "The name of the bucket"  
  default     = null
}

variable "lifecycle_rules" {
  type = any
  description = "List of maps containing configuration of object lifecycle management"
  default = []
}