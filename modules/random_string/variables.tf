variable "length" {
  type        = number
  description = "Include numeric characters in the result"  
  default     = null
}

variable "lower" {
  type        = bool
  description = "Include lowercase alphabet characters in the result"  
  default     = null
}

variable "numeric" {
  type        = bool
  description = "Include numeric characters in the result"  
  default     = null
}

variable "special" {
  type        = bool
  description = "Include special characters in the result"  
  default     = null
}

variable "upper" {
  type        = bool
  description = "Include uppercase alphabet characters in the result"  
  default     = null
}

variable "min_lower" {
  type        = number
  description = "Minimum number of lowercase alphabet characters in the result"  
  default     = null
}

variable "min_numeric" {
  type        = number
  description = "Minimum number of numeric characters in the result"  
  default     = null
}