// Provider
provider "aws" {
  region     = var.regions-eu
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  alias      = "us"
  region     = var.regions-us
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  alias      = "apac"
  region     = var.regions-apac
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

// Create ec2 instance - EU
resource "aws_instance" "EC2-Instance-eu" {
  ami                    = var.ami-id-eu
  instance_type          = var.instance_type
  key_name               = var.key_name-stockholm
  vpc_security_group_ids = [aws_security_group.DefaultTerraformSG.id]

  // Create main disk
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
    volume_type = "gp2"
    tags = {
      "name" = "root disk"
    }
  }

  // Tags
  tags = {
    Name = "EC2-Instance EU"
  }

  # // User data script
  user_data = file("files/install-webserver.sh")
}


// Create ec2 instance - US
resource "aws_instance" "EC2-Instance-us" {
  provider               = aws.us
  ami                    = var.ami-id-us
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.DefaultTerraformSG-us.id]

  // Create main disk
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
    volume_type = "gp2"
    tags = {
      "name" = "root disk"
    }
  }

  // Tags
  tags = {
    Name = "EC2-Instance US"
  }

  # // User data script
  user_data = file("files/install-webserver.sh")
}


// Create ec2 instance - APAC
resource "aws_instance" "EC2-Instance-apac" {
  provider               = aws.apac
  ami                    = var.ami-id-apac
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.DefaultTerraformSG-apac.id]

  // Create main disk
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
    volume_type = "gp2"
    tags = {
      "name" = "root disk"
    }
  }

  // Tags
  tags = {
    Name = "EC2-Instance APAC"
  }

  # // User data script
  user_data = file("files/install-webserver.sh")
}

// Create security group EU
resource "aws_security_group" "DefaultTerraformSG" {
  name        = "DefaultTerraformSG"
  description = "Allow 22 inbound traffic"
}


// Define the ingress rules
resource "aws_security_group_rule" "ingress_rules" {
  for_each = {
    "http" = { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP" }
    "ssh"  = { from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH" }
    "icmp" = { from_port = -1, to_port = -1, protocol = "icmp", description = "Allow ICMP" }
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.DefaultTerraformSG.id
  description       = each.value.description
}

// Define the egress rule
resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.DefaultTerraformSG.id
}


// Create security group US
resource "aws_security_group" "DefaultTerraformSG-us" {
  name        = "DefaultTerraformSG"
  description = "Allow 22 inbound traffic"
}


// Define the ingress rules 
resource "aws_security_group_rule" "ingress_rules-us" {
  for_each = {
    "http" = { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP" }
    "ssh"  = { from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH" }
    "icmp" = { from_port = -1, to_port = -1, protocol = "icmp", description = "Allow ICMP" }
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.DefaultTerraformSG-us.id
  description       = each.value.description
}

// Define the egress rule
resource "aws_security_group_rule" "egress_rule-us" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.DefaultTerraformSG-us.id
}

// Create security group APAC
resource "aws_security_group" "DefaultTerraformSG-apac" {
  name        = "DefaultTerraformSG"
  description = "Allow 22 inbound traffic"
}


// Define the ingress rules 
resource "aws_security_group_rule" "ingress_rules-apac" {
  for_each = {
    "http" = { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP" }
    "ssh"  = { from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH" }
    "icmp" = { from_port = -1, to_port = -1, protocol = "icmp", description = "Allow ICMP" }
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.DefaultTerraformSG-apac.id
  description       = each.value.description
}

// Define the egress rule
resource "aws_security_group_rule" "egress_rule-apac" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.DefaultTerraformSG-apac.id
}
