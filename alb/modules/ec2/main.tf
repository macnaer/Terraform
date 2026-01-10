// Create ec2 instance
resource "aws_instance" "EC2-Instance" {
  availability_zone      = var.a-zone
  ami                    = var.ami-id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.alb_sg_id]
  count                  = 2

  // Create main disk
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
    volume_type = "gp2"
    tags = {
      "name" = "root disk"
    }
  }

  metadata_options {
    http_endpoint = "enabled"
  }

  user_data = file("${path.module}/files/install-webserver.sh")
  // Tags
  tags = {
    Name = "EC2-Instance"
  }
}
