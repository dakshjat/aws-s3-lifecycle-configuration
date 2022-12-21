variable "bucket" {
  type        = string
  description = "The name of the bucket"
  default     = null
}

variable "block_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should block public ACLs for this bucket"
  default     = null
}

variable "block_public_policy" {
  type        = bool
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  default     = null
}

variable "ignore_public_acls" {
  type        = bool
  description = " Whether Amazon S3 should ignore public ACLs for this bucket"
  default     = null
}

variable "restrict_public_bucket" {
  type        = bool
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  default     = null
}
