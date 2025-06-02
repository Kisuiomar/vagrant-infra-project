#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo cp /vagrant/index.html /var/www/html/index.html
sudo cp /vagrant/style.css /var/www/html/style.css