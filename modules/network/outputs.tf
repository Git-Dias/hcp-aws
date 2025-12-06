output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = [for s in aws_subnet.public : s.id]
}

output "db_subnet_ids" {
  description = "IDs das subnets de banco de dados"
  value       = [for s in aws_subnet.db : s.id]
}
