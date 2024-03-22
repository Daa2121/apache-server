#!/bin/bash

# Install
# This part will be done for you on the gitlab-ci.
# You may do it manually on your VM.

## Fedora
# sudo dnf install httpd
# Enable incoming http/https using firewall GUI (optional)

## Debain (just fyi, it will behave differently than the grade container).
# sudo apt install apache2
# Use gufw or ufw to enable incoming http/https (optional)

echo "Runing on OS:"
cat /etc/os-release

if grep 'docker\|lxc' /proc/1/cgroup >/dev/null 2>&1;
then
    # Apache on the remote docker container
    # (for grading)

    # Enable and start Apache
    # Since systemctl is not on docker, 
    # run apache directly in the background.
    /usr/sbin/httpd -DFOREGROUND &

    # Get the files to serve in the right place to be served:
    DIR="/www/html"
    sudo cp -r "$DIR"/. /var/www/html/
    CGI="/www/cgi-bin"
    sudo cp -r "$CGI"/. /var/www/cgi-bin/
    # Set permissions for web directories
    sudo chmod -R 755 /var/www/html
    sudo chmod -R 755 /var/www/html
else
    # Apache on your local machine
    # (for easier development)

    # Enable and start Apache
    sudo systemctl start httpd.service

    # Get the files to serve in the right place to be served:
    DIR="/home/user/Assignments/CS3610/2024-SP-A-pa02_apache-daapkx/www/html"
    sudo cp -r "$DIR"/. /var/www/html/
    CGI="/home/user/Assignments/CS3610/2024-SP-A-pa02_apache-daapkx/www/cgi-bin"
    sudo cp -r "$CGI"/. /var/www/cgi-bin/
    # Set permissions for web directories
    sudo chmod -R 755 /var/www/html
    sudo chmod -R 755 /var/www/html
    
fi
