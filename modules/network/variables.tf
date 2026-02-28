variable "vpc_cidr_block" {
  type        = string
  description = "CIDR da VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs para subnets públicas"
}

variable "db_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs para subnets de banco de dados"
}

variable "public_subnet_auto_public_ip" {
  type    = bool
  default = false
}
