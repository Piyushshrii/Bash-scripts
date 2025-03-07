#!/bin/bash

# Ask for username to delete
read -p "Enter the username to delete: " USERNAME

# Delete the user along with the home directory
sudo userdel -r "$USERNAME"

echo "User '$USERNAME' has been deleted along with their home directory."

