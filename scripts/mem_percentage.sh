#!/bin/bash
MEMORY=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
THRESHOLD=80.0

if (( $(echo "$MEMORY > $THRESHOLD" | bc -l) )); then
    echo "Memory usage is high: $MEMORY%"
else
    echo "Memory usage is normal: $MEMORY%"
fi
