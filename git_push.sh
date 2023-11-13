#!/bin/bash

# Navigate to the project directory
cd my_directory

# Add all changes
git add .

# Commit with a default message or take a message as an argument
git commit -m "${1:-'Automated commit'}"

# Push changes to the remote repository
git push
