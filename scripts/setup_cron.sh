#!/bin/bash

BACKUP_SCRIPT_LOC="/home/ec2-user/work/shell-scripting/scripts/backup.sh"

chmod +x $BACKUP_SCRIPT_LOC

CRON_JOBS="0 0 * * * $BACKUP_SCRIPT_LOC > /home/ec2-user/backup.log 2>&1"

(crontab -l 2>/dev/null | grep -F "$BACKUP_SCRIPT_LOC") || (crontab -l 2>/dev/null; echo "$CRON_JOBS") | crontab -

echo "Cron job added to run backup script every day at midnight."
