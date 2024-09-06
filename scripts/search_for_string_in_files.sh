#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if the `grep` command is available
if ! command_exists grep; then
    echo "The 'grep' command is required but not found. Please install it and try again."
    exit 1
fi

# Search for the word "TODO" in all .sh files in the current directory
echo "Searching for 'TODO' in .sh files..."

# Find .sh files and search for "TODO" in them
grep -lR "TODO" *.sh

# Check if any files were found
if [ $? -ne 0 ]; then
    echo "No .sh files with 'TODO' found in the current directory."
else
    echo "Search complete."
fi
