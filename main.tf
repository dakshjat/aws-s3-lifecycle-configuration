provider "aws" {
  region = "ap-south-1"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "random_string" {
  source = "./modules/random_string"

  length      = var.length
  lower       = var.lower
  numeric     = var.numeric
  special     = var.special
  upper       = var.upper
  min_lower   = var.min_lower
  min_numeric = var.min_numeric
}

data "aws_iam_policy_document" "s3_kms_policy" {
  statement {
    effect = "Allow"
    actions = ["kms:*"]
    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::856696447076:root"]
    }
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    principals {
      type = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    resources = ["*"]
    condition {
      test = "StringEquals"
      variable = "kms:CallerAccount"
      values = ["${data.aws_caller_identity.current.account_id}"]
    }
  }
}

module "s3_kms" {
  source = "./modules/kms"

  description               = "AWS KMS for the Amazon S3 bucket - ${var.environment}-${var.bucket}-${module.random_string.id}"
  deletion_window_in_days   = var.deletion_window_in_days
  policy                    = data.aws_iam_policy_document.s3_kms_policy.json
  enable_key_rotation       = true
  tags                      = {
    Name        = "AWS KMS for Amazon S3 bucket - ${var.environment}-${var.bucket}-${module.random_string.id}-s3"
    Environment = var.environment
  }

}

module "s3_bucket" {
  source = "./modules/s3_bucket"
  
  bucket        = "${var.environment}-${var.bucket}-${module.random_string.id}-s3"
  tags = {
    Name        = "${var.environment}-${var.bucket}-${module.random_string.id}-s3"
    Environment = var.environment
  }
}

module "s3_bucket_public_access_block" {
  source = "./modules/s3_bucket_public_access_block"

  bucket = module.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_bucket = true
}  

module "s3_bucket_encryption" {
  source = "./modules/s3_bucket_encryption"

  bucket            = module.s3_bucket.id
  kms_master_key_id = module.s3_kms.key_id
  sse_algorithm     = var.s3_sse_algorithm
}

module "s3_bucket_versioning" {
  source = "./modules/s3_bucket_versioning"

  bucket = module.s3_bucket.id
  status = "Enabled"
}

module "s3_lifecycle_configuration" {
  source = "./modules/s3_lifecycle_configuration"

  bucket          = module.s3_bucket.id
  lifecycle_rules = [
  {
    id = "rule-1"
    filter = {
      prefix = "logs/"
    }
    expiration = {
      days = 90
    }
    status = "Enabled"
  },
  {   
    id = "rule-2"
    filter  = {
      prefix = "tmp/"
    }
    expiration = {
      days = 90
    }
    status = "Enabled"
  },
  {
    id      = "rule-3"
    enabled = true

    filter = {
      tags = {
        some    = "value"
        another = "value2"
      }
    }

    transition = [
      {
        days          = 30
        storage_class = "ONEZONE_IA"
      },
      {
        days          = 60
        storage_class = "GLACIER"
      }
    ]
  },
  {
    id                                     = "rule-4"
    enabled                                = true
    abort_incomplete_multipart_upload_days = 7

    noncurrent_version_transition = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
      {
        days          = 60
        storage_class = "ONEZONE_IA"
      },
      {
        days          = 90
        storage_class = "GLACIER"
      },
    ]
    noncurrent_version_expiration = {
      days = 300
    }
  },
  {
    id      = "rule-5"
    enabled = true

    filter = {
      prefix                   = "log1/"
      object_size_greater_than = 200000
      object_size_less_than    = 500000
      tags = {
        some    = "value"
        another = "value2"
      }
    }
    noncurrent_version_transition = [
      {
        days          = 30
        storage_class = "STANDARD_IA"
      },
    ]
    noncurrent_version_expiration = {
      days = 300
    }
  }
  ]
}