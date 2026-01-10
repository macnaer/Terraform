#! /bin/bash

apt update -y
apt install -y apache2
systemctl start apache2
systemctl enable apache2

INSTANCE_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
echo "<h1>Terraform Demo</h1><p>Instance IP: $INSTANCE_IP</p>" > /var/www/html/index.html