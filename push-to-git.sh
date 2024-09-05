#!/bin/bash

# Navigate to your project directory
cd /home/ec2-user/work/shell-scripting/

# Add all changed files to Git
git add .

# Commit the changes with a message containing the current date and time
git commit -m "Auto-commit: $(date)"
