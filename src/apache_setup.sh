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
    echo "\nDelete this line and write your code"

    # Get the files to serve in the right place to be served:
    # Use sudo here
    echo "\nDelete this line and write your code"

    # Set permissions for web directories
    echo "\nDelete this line and write your code"
else
    # Apache on your local machine
    # (for easier development)

    # Enable and start Apache
    echo "\nDelete this line and write your code"

    # Get the files to serve in the right place to be served:
    echo "\nDelete this line and write your code"

    # Set permissions for web directories
    echo "\nDelete this line and write your code"
fi
