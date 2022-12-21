variable "bucket" {
  type        = string
  description = "The name of the bucket"
  default     = null
}

variable "kms_master_key_id" {
  type        = string
  description = "The AWS KMS master key ID used for the SSE-KMS encryption"
  default     = null
}

variable "sse_algorithm" {
  type        = string
  description = "The server-side encryption algorithm to use"
  default     = null
}