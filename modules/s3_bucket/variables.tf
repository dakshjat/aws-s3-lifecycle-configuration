variable "tags" {
  type        = map
  description = "A map of tags to assign to the bucket"  
  default     = {}
}

variable "bucket" {
  type        = string
  description = "The name of the bucket"  
  default     = null
}