#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if the script is running on a Debian/Ubuntu-based system
if ! command_exists apt-get; then
    echo "This script is intended for Debian/Ubuntu-based systems."
    exit 1
fi

# Uninstall apache2 and remove its configuration files
echo "Uninstalling apache2 and removing its configuration files..."

# Remove apache2 package and its configuration files
sudo apt-get remove --purge -y apache2 apache2-utils apache2-bin apache2.2-common

# Clean up unnecessary packages and dependencies
sudo apt-get autoremove -y

# Remove any remaining configuration files or directories
sudo rm -rf /etc/apache2
sudo rm -rf /var/www/html

# Clean up package cache
sudo apt-get clean

echo "Apache2 has been successfully uninstalled and its configuration files removed."

: ' 
#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if the script is running on a RHEL/CentOS-based system
if ! command_exists yum && ! command_exists dnf; then
    echo "This script is intended for RHEL/CentOS-based systems."
    exit 1
fi

# Uninstall httpd and remove its configuration files
echo "Uninstalling httpd and removing its configuration files..."

# Remove httpd package and its configuration files
if command_exists dnf; then
    sudo dnf remove -y httpd
else
    sudo yum remove -y httpd
fi

# Clean up unnecessary packages and dependencies
if command_exists dnf; then
    sudo dnf autoremove -y
else
    sudo yum autoremove -y
fi

# Remove any remaining configuration files or directories
sudo rm -rf /etc/httpd
sudo rm -rf /var/www/html

# Clean up package cache
if command_exists dnf; then
    sudo dnf clean all
else
    sudo yum clean all
fi

echo "httpd has been successfully uninstalled and its configuration files removed."
'
