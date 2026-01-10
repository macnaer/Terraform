output "alb_sg_id" {
  description = "ALB Security Group"
  value       = aws_security_group.alb_security_group.id
}
