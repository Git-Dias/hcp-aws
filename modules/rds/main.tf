resource "aws_db_subnet_group" "this" {
  name       = "lab-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "lab-rds-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = "labdb"
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot  = true
  storage_encrypted    = false

  publicly_accessible = false

  tags = {
    Name = "lab-rds"
  }
}
