output "versioning_configuration" {
  value       = aws_s3_bucket_versioning.this.versioning_configuration
  description = "Configuration block for the versioning parameters"
}