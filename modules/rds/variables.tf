variable "vpc_id" {
  type        = string
  description = "ID da VPC onde o RDS será criado"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Lista de subnets para o DB subnet group"
}

variable "engine" {
  type        = string
  description = "Engine do banco (ex: postgres, mysql)"
}

variable "engine_version" {
  type        = string
  description = "Versão da engine"
}

variable "instance_class" {
  type        = string
  description = "Classe da instância RDS"
}

variable "allocated_storage" {
  type        = number
  description = "Armazenamento alocado em GB"
}

variable "username" {
  type        = string
  description = "Usuário master do banco"
}

variable "password" {
  type        = string
  description = "Senha do usuário master"
  sensitive   = true
}
