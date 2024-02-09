#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd 
# Get the server's IP address
server_ip=$(curl -s http://checkip.amazonaws.com)

# Add server IP to the HTML file
echo "Hello, welcome to our website. Server IP: $server_ip" >> /var/www/html/index.html