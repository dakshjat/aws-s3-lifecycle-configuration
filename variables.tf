variable "environment" {
  type        = string
  description = "Environment name"
}

variable "bucket" {
  type        = string
  description = "The name of the bucket"
}

variable "length" {
  type        = number
  description = "Include numeric characters in the result"  
}

variable "lower" {
  type        = bool
  description = "Include lowercase alphabet characters in the result"  
}

variable "numeric" {
  type        = bool
  description = "Include numeric characters in the result"  
}

variable "special" {
  type        = bool
  description = "Include special characters in the result"  
}

variable "upper" {
  type        = bool
  description = "Include uppercase alphabet characters in the result"  
}

variable "min_lower" {
  type        = number
  description = "Minimum number of lowercase alphabet characters in the result"  
}

variable "min_numeric" {
  type        = number
  description = "Minimum number of numeric characters in the result"  
}

variable "deletion_window_in_days" {
  type        = number
  description = "AWS KMS deletion waiting period"  
}

variable "s3_sse_algorithm" {
  type        = string
  description = "The server-side encryption algorithm to use"
}

variable "s3_bucket_acl" {
  type        = string
  description = "The canned ACL to apply to the bucket"
}