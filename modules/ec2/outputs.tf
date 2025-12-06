output "instance_ids" {
  description = "IDs das instâncias EC2 criadas"
  value       = aws_instance.this[*].id
}

output "public_ips" {
  description = "IPs públicos das instâncias (se houver)"
  value       = aws_instance.this[*].public_ip
}
