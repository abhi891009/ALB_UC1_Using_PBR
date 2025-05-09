#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>Welcome to the Homepage (Hello Instance A - AZ1)</h1>" > /usr/share/nginx/html/index.html