#!/bin/bash
#
EMAIL_ID="devopslearner004@gmail.com"
LOG_FILE="/home/ec2-user/log/monitor_cpu.log"

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')

THRESHOLD=50

#if (( $(echo "$CPU_IDLE > $THRESHOLD" | bc -l) )); then
if [ $CPU_IDLE > THRESHOLD ]; then
	echo "$(date):CPU usage is below $THRESHOLD%. Sending email alert..." >> $LOG_FILE

    echo "Alert: CPU usage is below $THRESHOLD%. Current CPU usage: $CPU_IDLE%" | mail -s "CPU Usage Alert" $EMAIL_ID
else
	echo "$(date): CPU usage is above $THRESHOLD%. No action needed." >> $LOG_FILE
fi
