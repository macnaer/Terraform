#!/bin/bash
sudo apt -y update
sudo apt -y install apache2
systemctl start apache2
systemctl enable apache2
echo "<h1>Web Server : $(hostname -i)</h1>" > /var/www/html/index.html