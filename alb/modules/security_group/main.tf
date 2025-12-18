// Create SG for ALB
resource "aws_security_group" "alb_security_group" {
  name        = "ALB Security Group"
  description = "Allow 80 inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "ALB Security Group"
  }
}

// Define the ingress rules
resource "aws_security_group_rule" "ingress_rules" {
  for_each = {
    "http"    = { from_port = 80, to_port = 80,  protocol = "tcp", description = "Allow HTTP" }
    "icmp" = { from_port = -1, to_port = -1, protocol = "icmp", description = "Allow ICMP" }
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_security_group.id
  description       = each.value.description
}

// Define the egress rule
resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_security_group.id
}

// Create SG for EC2
resource "aws_security_group" "ec2_security_group" {
  name        = "EC2 Security Group"
  description = "Security Group for Web Server Instances"

  vpc_id      = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 Security Group"
  }
}
