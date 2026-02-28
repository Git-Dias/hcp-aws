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

variable "enable_encryption" {
  type        = bool
  description = "Habilita criptografia no bucket"
  default     = false
}

variable "sse_algorithm" {
  type        = string
  description = "Algoritmo de criptografia (AES256 ou aws:kms)"
  default     = "AES256"
}

variable "kms_key_id" {
  type        = string
  description = "KMS Key ID quando utilizar aws:kms"
  default     = null
}
