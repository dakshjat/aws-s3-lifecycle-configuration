output "key_id" {
  value       = aws_kms_key.this.key_id
  description = "The globally unique identifier for the key"
}

output "arn" {
  value       = aws_kms_key.this.arn
  description = "The ARN of the key"
}