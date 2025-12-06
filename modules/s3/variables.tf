variable "bucket_name_prefix" {
  type        = string
  description = "Prefixo para o nome do bucket S3"
}

variable "versioning_enabled" {
  type        = bool
  description = "Habilita versionamento no bucket"
  default     = true
}

variable "mfa_delete_enabled" {
  type = bool
  default = false
}
