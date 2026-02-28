resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "lab-vpc"
  }
}

# Subnets públicas
resource "aws_subnet" "public" {
  for_each = toset(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  map_public_ip_on_launch = var.public_subnet_auto_public_ip

  tags = {
    Name = "lab-public-${each.value}"
    Type = "public"
  }
}

# Subnets de banco de dados
resource "aws_subnet" "db" {
  for_each = toset(var.db_subnet_cidrs)

  vpc_id     = aws_vpc.this.id
  cidr_block = each.value

  tags = {
    Name = "lab-db-${each.value}"
    Type = "db"
  }
}
