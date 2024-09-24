#!/bin/bash
#
THRESHOLD=5

df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $1}' | while read output; do USAGE=$(echo $output | awk '{print $1}' | sed 's/%//')
PARTITION=$(echo $output | awk '{print $2}')
if [ $USAGE -ge $THRESHOLD ]; then
	echo "Warning: Disk space on $PARTITION is ${USAGE}% full."
    fi
done
