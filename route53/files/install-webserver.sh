#!/bin/bash

apt-get update -y
apt-get install -y apache2

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/public-ipv4)

  
echo "<h1>Public IP $PUBLIC_IP</h1>" > /var/www/html/index.html

HOSTNAME=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/hostname)  

echo "<h1>Hostname $HOSTNAME</h1>" >> /var/www/html/index.html

LOCAL_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)  

echo "<h1>Local IP $LOCAL_IP</h1>" >> /var/www/html/index.html

systemctl enable apache2
systemctl start apache2