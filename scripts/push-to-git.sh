#!/bin/bash

# Set Git user name and email for commits (specific to this repository)
git config user.name "Pavan-D4"
git config user.email "pavanreddy5698@gmail.com"

# Navigate to your project directory
cd /home/ec2-user/work/shell-scripting/

# Add all changed files to Git
git add .

# Commit the changes with a message containing the current date and time
git commit -m "Auto-commit: $(date)"

# Push the changes to the remote repo
git push https://$1@github.com/Pavan-D4/shell-scripting.git main 

echo "Changes pushed to Git repository!"
