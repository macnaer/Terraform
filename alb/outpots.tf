output "alb_dns_name" {
  description = "DNS name of Application Load Balancer"
  value       = module.alb.alb_dns_name
}