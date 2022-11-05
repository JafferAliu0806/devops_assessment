#!/bin/bash 
sudo amazon-linux-extras install nginx1 -y
sudo systemctl start nginx 
sudo systemctl enable nginx
sudo aws s3 cp s3://mytest-sg-assessment-04112022/index.html /usr/share/nginx/html/index.html
sudo systemctl restart nginx 
