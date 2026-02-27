resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  bucket_name = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

data "aws_iam_policy_document" "ssl_policy" {
  count = var.require_ssl ? 1 : 0

  statement {
    sid    = "DenyInsecureTransport"
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.require_ssl ? 1 : 0
  bucket = aws_s3_bucket.this.bucket
  policy = data.aws_iam_policy_document.ssl_policy[0].json
}