variable "bucket" {
  type        = string
  description = "The name of the bucket"
  default     = null
}

variable "status" {
  type        = string
  description = "The versioning state of the bucket"
  default     = null
}
