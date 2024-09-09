#!/bin/bash
#
SERVICE="nginx"
EMAIL_ID="devopslearner004@gmail.com"
LOGFILE="/home/ec2-user/log/monitor_nginx.log"

# function to send email
send_mail(){
	local subject=$1
	local body=$2
	echo -e "$body" | mail -s "$subject" "$EMAIL_ID"
}

SERVICE_ACTIVE=$(sudo systemctl is-active $SERVICE)

if [ $SERVICE_ACTIVE == "active" ];then
	echo "$(date): $SERVICE is running." >> $LOGFILE
else
	echo "$(date): $SERVICE is NOT running." >> $LOGFILE

	send_mail "$SERVICE Service Alert" "$SERVICE service is down. Attempting to restart." #send email alert
	
	sudo systemctl restart $SERVICE
	if [[ $? -eq 0 ]];then
		echo "$(date): $SERVICE restarted successfully." >> $LOGFILE
		send_mail "$SERVICE Service Restarted" "$SERVICE was down and has been successfully restarted."
	else
		echo "$(date): Failed to restart $SERVICE." >> $LOGFILE
		send_mail "$SERVICE service restrt failed" "$SERVICE was failed to restart, manual intervention required."
	fi
fi
