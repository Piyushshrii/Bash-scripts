#!/bin/bash

# Ask for username
read -p "Enter username: " USERNAME

# Ask for password (input hidden)
read -s -p "Enter password: " PASSWORD
echo

# Create the user
sudo useradd -m "$USERNAME"

# Set the password for the user
echo "$USERNAME:$PASSWORD" | sudo chpasswd

echo "User '$USERNAME' created successfully!"

