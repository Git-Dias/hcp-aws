variable "vpc_id" {
  type        = string
  description = "ID da VPC onde as instâncias serão criadas"
}

variable "subnet_id" {
  type        = string
  description = "Subnet onde as instâncias serão criadas"
}

variable "instance_type" {
  type        = string
  description = "Tipo das instâncias EC2"
  default     = "t3.micro"
}

variable "instance_count" {
  type        = number
  description = "Quantidade de instâncias EC2"
  default     = 1
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}