locals {
  # Garante um nome único de bucket combinando prefixo + random
  bucket_name = "${var.bucket_name_prefix}-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name

  tags = {
    Name = "lab-s3"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}
