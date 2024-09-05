#!/bin/bash

# Script to list all active network interfaces

echo "Active network interfaces:"
ip -o link show | awk '$9 == "UP" {print $2}' | sed 's/://'
