output "vpc_id" {
  value       = aws_vpc.mes_vpc.id
  description = "VPC id"

  sensitive = false
}
