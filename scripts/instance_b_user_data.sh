#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
mkdir -p /usr/share/nginx/html/images
echo "<h1>Images Section (Hello Instance B - AZ2)</h1>" > /usr/share/nginx/html/images/index.html