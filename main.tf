# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "DiazTech"

    workspaces {
      name = "hcp-aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

############################
# MÓDULO DE NETWORK (VPC)
############################

module "network" {
  count  = var.enable_network ? 1 : 0
  source = "./modules/network"

  vpc_cidr_block      = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24"]
  db_subnet_cidrs     = ["10.0.2.0/24"]
}

############################
# MÓDULO DE EC2
############################

module "ec2" {
  count  = var.enable_ec2 ? 1 : 0
  source = "./modules/ec2"

  # Depende da VPC e subnet pública criadas pelo módulo de network
  # Importante: para EC2 funcionar, enable_network também deve estar true
  vpc_id    = one(module.network[*].vpc_id)
  subnet_id = one(module.network[*].public_subnet_ids)[0]

  instance_type  = "t3.micro"
  instance_count = 1
}

############################
# MÓDULO DE S3
############################

module "s3" {
  count              = var.enable_s3 ? 1 : 0
  source             = "./modules/s3"
  bucket_name_prefix = "lab-modular"
  enable_encryption  = var.s3_enable_encryption
  sse_algorithm      = var.s3_sse_algorithm
  kms_key_id         = var.s3_kms_key_id
}

############################
# MÓDULO DE RDS
############################

module "rds" {
  count  = var.enable_rds ? 1 : 0
  source = "./modules/rds"

  # RDS normalmente fica em subnets privadas / de banco
  vpc_id     = one(module.network[*].vpc_id)
  subnet_ids = one(module.network[*].db_subnet_ids)

  engine            = "postgres"
  engine_version    = "14.11"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = "adminuser"
  password          = "TroqueEstaSenha1234!" # em produção, use variável sensível
}
