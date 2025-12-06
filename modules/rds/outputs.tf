output "endpoint" {
  description = "Endpoint do banco RDS"
  value       = aws_db_instance.this.address
}

output "port" {
  description = "Porta do RDS"
  value       = aws_db_instance.this.port
}
