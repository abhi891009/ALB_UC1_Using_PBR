#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
mkdir -p /usr/share/nginx/html/register
echo "<h1>Registration Page (Instance C - AZ3)</h1>" > /usr/share/nginx/html/register/index.html
 