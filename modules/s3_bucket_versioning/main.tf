resource "aws_s3_bucket_versioning" "this" {
  bucket = var.bucket
  versioning_configuration {
    status = var.status
  }
}
