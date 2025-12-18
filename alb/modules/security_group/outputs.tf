output "alb_sg_id" {
  description = "ALB Security Group"
  value = aws_security_group.alb_security_group.id
}

output "ec2_sg_id" {
  description = "EC2 Security Group"
  value = aws_security_group.ec2_security_group.id
}