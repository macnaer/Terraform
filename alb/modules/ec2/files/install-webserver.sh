#!/bin/bash

apt-get update -y
apt-get install -y apache2

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/public-ipv4)

echo "<h1>Terraform Demo</h1><p>Public IP: $PUBLIC_IP</p>" > /var/www/html/index.html

systemctl enable apache2
systemctl start apache2