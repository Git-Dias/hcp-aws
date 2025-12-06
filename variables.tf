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
  default     = false
}

variable "enable_s3" {
  type        = bool
  description = "Habilita a criação de buckets S3"
  default     = false
}

variable "enable_rds" {
  type        = bool
  description = "Habilita a criação de instância RDS"
  default     = true
}