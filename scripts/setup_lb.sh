#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
cat <<EOL | sudo tee /etc/nginx/sites-available/simple
upstream backend {
    server 192.168.56.10;
    server 192.168.56.11;
    server 192.168.56.13;
}
server {
    listen 80;
    location / {
        proxy_pass http://backend;
        proxy_set_header Host \$host;
    }
}
EOL
sudo ln -sf /etc/nginx/sites-available/simple /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
