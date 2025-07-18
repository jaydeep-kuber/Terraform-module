#!/bin/bash

# install_nginx.sh
# This script installs Nginx on a Linux system.
set -e # Exit immediately if a command exits with a non-zero status.
# Update package index
sudo apt-get update -y
# Install Nginx
sudo apt-get install nginx -y
# Start Nginx service
sudo systemctl start nginx
# Enable Nginx to start on boot
sudo systemctl enable nginx
# Check Nginx status
sudo systemctl status nginx || true
# Print installation success message
echo "Nginx has been installed and started successfully."
# Print the Nginx version
nginx -v || true
# Print the Nginx configuration test result
sudo nginx -t || true

# copy default configuration file
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bck
# copy def html file
sudo cp /var/www/html/*.html /var/www/html/*.html.bck

# add custome html content
echo "<html>
<head>
    <title>Welcome to Nginx</title>
</head>
<body>
    <h1>Hello from  Nginx!</h1>
    <p>Your infrastructure is ready...</p>
</body>
</html>" | sudo tee /var/www/html/index.html > /dev/null