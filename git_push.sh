#!/bin/bash

# Navigate to the project directory
cd my directory

# List untracked and modified files
git status -s

# Ask the user for the file to add
read -p "Enter the file you want to add (or press Enter to add all): " file_to_add

# Add the chosen file or all files
if [ -z "$file_to_add" ]; then
    git add .
else
    git add "$file_to_add"
fi

# Ask the user for the commit message
read -p "Enter the commit message: " commit_message

# Commit with the entered message or a default message
git commit -m "${commit_message:-'Automated commit'}"

# Push changes to the remote repository
git push

