output "alb_dns_name" {
  description = "DNS name of Application Load Balancer"
  value       = aws_lb.app_lb.dns_name
}