output "vpc_id" {
  description = "Export the VPC ID"
  value       = aws_vpc.custom_vpc.id
}

output "igw_id" {
  description = "Export the IGW ID"
  value       = aws_internet_gateway.igw_vpc
}

output "public_subnet_ids" {
  description = "Export the Public Subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}
