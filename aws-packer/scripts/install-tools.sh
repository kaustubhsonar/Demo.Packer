#!/bin/bash
sudo sleep 10
sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo ufw allow proto tcp from any to any port 22,80,443