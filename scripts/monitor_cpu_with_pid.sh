#!/bin/bash

# Check if a PID is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <PID>"
    exit 1
fi

PID=$1

# Check if the process with the provided PID exists
if ! ps -p $PID > /dev/null 2>&1; then
    echo "Process with PID $PID does not exist."
    exit 1
fi

echo "Monitoring CPU usage for PID: $PID"
echo "Press [CTRL+C] to stop monitoring."

# Loop to check CPU usage every 5 seconds
while true; do
    # Use the `ps` command to get the CPU usage of the process
    CPU_USAGE=$(ps -p $PID -o %cpu --no-headers)

    # Check if the process is still running
    if [ -z "$CPU_USAGE" ]; then
        echo "Process $PID has terminated."
        exit 0
    fi

    # Print the CPU usage
    echo "CPU Usage for PID $PID: $CPU_USAGE%"

    # Sleep for 5 seconds before the next check
    sleep 5
done
