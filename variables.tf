variable "aws_region" {
  type        = string
  description = "Região AWS usada no laboratório"
  default     = "us-east-1"
}

variable "enable_network" {
  type        = bool
  description = "Habilita a criação de VPC e subnets"
  default     = true
}

variable "enable_ec2" {
  type        = bool
  description = "Habilita a criação de instâncias EC2"
  default     = true
}

variable "enable_s3" {
  type        = bool
  description = "Habilita a criação de buckets S3"
  default     = true
}

variable "enable_rds" {
  type        = bool
  description = "Habilita a criação de instância RDS"
  default     = true
}

variable "s3_enable_encryption" {
  type        = bool
  description = "Habilita criptografia no bucket S3"
  default     = true
}

variable "s3_sse_algorithm" {
  type        = string
  description = "Algoritmo de criptografia do bucket S3 (AES256 ou aws:kms)"
  default     = "aws:kms"
}


variable "s3_kms_key_id" {
  type        = string
  description = "ARN da KMS Key para criptografia do bucket S3"
  default     = "arn:aws:kms:us-east-1:123456789012:key/abc123"
}