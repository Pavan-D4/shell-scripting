#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if curl is installed
if command_exists curl; then
    echo "curl is already installed."
else
    echo "curl is not installed. Installing now..."

    # Determine the package manager and install curl
    if command_exists apt-get; then
        # For Debian/Ubuntu-based systems
        sudo apt-get update
        sudo apt-get install -y curl
    elif command_exists yum; then
        # For RHEL/CentOS-based systems
        sudo yum install -y curl
    elif command_exists dnf; then
        # For Fedora systems
        sudo dnf install -y curl
    elif command_exists zypper; then
        # For openSUSE systems
        sudo zypper install -y curl
    elif command_exists pacman; then
        # For Arch-based systems
        sudo pacman -Syu --noconfirm curl
    else
        echo "Unsupported package manager. Please install curl manually."
        exit 1
    fi
fi
