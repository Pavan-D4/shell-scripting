Here are 10 common shell scripting interview questions for DevOps roles, along with their answers. Each of these scripts helps demonstrate practical shell scripting skills that are often needed for DevOps tasks, such as automation, environment management, and server maintenance.
1. Script to Check if a Process is Running
bash
Copy code
#!/bin/bash
PROCESS=$1

if pgrep $PROCESS > /dev/null
then
    echo "$PROCESS is running"
else
    echo "$PROCESS is not running"
fi

Explanation:
This script takes a process name as input, checks if it's running using the pgrep command, and prints the status.
You pass the process name as an argument: ./script.sh nginx.

2. Script to Find Disk Usage and Alert if it Exceeds a Threshold
bash
Copy code
#!/bin/bash
THRESHOLD=90
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $1}' | while read output; do
    USAGE=$(echo $output | awk '{print $1}' | sed 's/%//')
    PARTITION=$(echo $output | awk '{print $2}')
    if [ $USAGE -ge $THRESHOLD ]; then
        echo "Warning: Disk space on $PARTITION is ${USAGE}% full."
    fi
done

Explanation:
This script checks disk usage on each partition and warns if usage exceeds 90%.
You can customize the threshold value as needed.

3. Script to Monitor Memory Usage
bash
Copy code
#!/bin/bash
MEMORY=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
THRESHOLD=80.0

if (( $(echo "$MEMORY > $THRESHOLD" | bc -l) )); then
    echo "Memory usage is high: $MEMORY%"
else
    echo "Memory usage is normal: $MEMORY%"
fi

Explanation:
This script calculates the percentage of memory used and alerts if it's over the threshold (80%).

4. Backup Files Script
bash
Copy code
#!/bin/bash
SRC_DIR="/path/to/source"
DEST_DIR="/path/to/destination"
DATE=$(date +%Y%m%d)
tar -czf $DEST_DIR/backup_$DATE.tar.gz $SRC_DIR

if [ $? -eq 0 ]; then
    echo "Backup successful!"
else
    echo "Backup failed!"
fi

Explanation:
This script creates a compressed backup of the source directory and saves it to the destination directory with a date-based filename.
It also checks if the operation was successful using $?.

5. Script to Restart a Service if it’s Down
bash
Copy code
#!/bin/bash
SERVICE=$1

if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is not running, restarting..."
    systemctl restart $SERVICE
    if [ $? -eq 0 ]; then
        echo "$SERVICE restarted successfully!"
    else
        echo "Failed to restart $SERVICE"
    fi
fi

Explanation:
This script checks the status of a service and restarts it if it’s not running.
Replace $1 with the service name you want to monitor (e.g., nginx, jenkins).

6. Script to List All Open Network Ports
bash
Copy code
#!/bin/bash
netstat -tuln

Explanation:
This is a simple script that uses netstat to list all open network ports (TCP and UDP) along with their listening status.
Useful for checking active network connections.

7. Script to Check for a Specific File and Execute a Command if Found
bash
Copy code
#!/bin/bash
FILE="/path/to/file.txt"

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    # Perform action here (e.g., delete or copy)
else
    echo "$FILE does not exist."
fi

Explanation:
This script checks if a specific file exists and then runs a command if found. The command can be anything like copying, moving, or deleting the file.

8. Script to Archive Logs Older than 7 Days
bash
Copy code
#!/bin/bash
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/archived"
find $LOG_DIR -type f -mtime +7 -exec mv {} $ARCHIVE_DIR \;

Explanation:
This script finds and moves log files older than 7 days from the main log directory to an archive directory.

9. Script to Ping Multiple Servers and Check Availability
bash
Copy code
#!/bin/bash
SERVERS=("192.168.1.1" "192.168.1.2" "192.168.1.3")

for SERVER in "${SERVERS[@]}"; do
    ping -c 2 $SERVER > /dev/null
    if [ $? -eq 0 ]; then
        echo "$SERVER is reachable"
    else
        echo "$SERVER is down"
    fi
done

Explanation:
This script pings a list of servers and checks if they are reachable, outputting their availability.

10. Script to Display the 5 Largest Files in a Directory
bash
Copy code
#!/bin/bash
DIRECTORY="/path/to/directory"
find $DIRECTORY -type f -exec du -h {} + | sort -rh | head -n 5

Explanation:
This script finds and displays the top 5 largest files in a specified directory, sorted by size.

Tips for Using These Scripts in Interviews:
Explain the logic behind the script to show understanding.
Discuss possible improvements, such as adding error handling, logging, or automation features.
Understand performance concerns and scalability, especially when dealing with larger files or remote servers.
Customize the scripts for specific environments like production, dev, or cloud-based infrastructure when needed.
Talk about real-world use cases where you have used similar scripts or where they could be applied in a DevOps environment.
These scripts are designed to cover common DevOps tasks, showcasing proficiency in automation, monitoring, and server management.
Certainly! Here’s a collection of example scripts that cover various concepts related to processes, services, disk usage, and memory usage in shell scripting. These scripts can be used for monitoring, reporting, and managing system resources.
1. Check Disk Usage of a Directory
bash
Copy code
#!/bin/bash

# Usage: ./disk_usage.sh /path/to/directory

DIRECTORY=$1

if [ -z "$DIRECTORY" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

echo "Disk usage of $DIRECTORY:"
du -sh "$DIRECTORY"

2. Check Free Disk Space on Filesystem
bash
Copy code
#!/bin/bash

# Usage: ./disk_free.sh

echo "Disk free space on all filesystems:"
df -h

3. Monitor Memory Usage
bash
Copy code
#!/bin/bash

# Usage: ./memory_usage.sh

echo "Memory usage:"
free -h

4. List All Running Processes
bash
Copy code
#!/bin/bash

# Usage: ./list_processes.sh

echo "List of all running processes:"
ps aux

5. Check Specific Process Status
bash
Copy code
#!/bin/bash

# Usage: ./check_process.sh process_name

PROCESS_NAME=$1

if [ -z "$PROCESS_NAME" ]; then
    echo "Usage: $0 process_name"
    exit 1
fi

PROCESS_COUNT=$(ps aux | grep -v grep | grep -c "$PROCESS_NAME")

if [ "$PROCESS_COUNT" -gt 0 ]; then
    echo "$PROCESS_NAME is running."
else
    echo "$PROCESS_NAME is not running."
fi

6. Start a Service
bash
Copy code
#!/bin/bash

# Usage: ./start_service.sh service_name

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 service_name"
    exit 1
fi

sudo systemctl start "$SERVICE_NAME"

if [ $? -eq 0 ]; then
    echo "$SERVICE_NAME started successfully."
else
    echo "Failed to start $SERVICE_NAME."
fi

7. Stop a Service
bash
Copy code
#!/bin/bash

# Usage: ./stop_service.sh service_name

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 service_name"
    exit 1
fi

sudo systemctl stop "$SERVICE_NAME"

if [ $? -eq 0 ]; then
    echo "$SERVICE_NAME stopped successfully."
else
    echo "Failed to stop $SERVICE_NAME."
fi

8. Restart a Service
bash
Copy code
#!/bin/bash

# Usage: ./restart_service.sh service_name

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 service_name"
    exit 1
fi

sudo systemctl restart "$SERVICE_NAME"

if [ $? -eq 0 ]; then
    echo "$SERVICE_NAME restarted successfully."
else
    echo "Failed to restart $SERVICE_NAME."
fi

9. Check if a Service is Running
bash
Copy code
#!/bin/bash

# Usage: ./check_service.sh service_name

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 service_name"
    exit 1
fi

SERVICE_STATUS=$(systemctl is-active "$SERVICE_NAME")

if [ "$SERVICE_STATUS" = "active" ]; then
    echo "$SERVICE_NAME is running."
else
    echo "$SERVICE_NAME is not running."
fi

10. Monitor Disk Usage and Send Alert
bash
Copy code
#!/bin/bash

# Usage: ./disk_alert.sh threshold

THRESHOLD=$1

if [ -z "$THRESHOLD" ]; then
    echo "Usage: $0 threshold"
    exit 1
fi

# Check disk usage percentage for root filesystem
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Disk usage is above threshold: ${USAGE}%"
    # You can add additional alert mechanisms here (e.g., email, SMS)
else
    echo "Disk usage is below threshold: ${USAGE}%"
fi

Summary of Concepts:
du: Measures disk usage of files or directories.
df: Shows free and used disk space on filesystems.
free: Displays memory usage including RAM and swap.
ps: Lists running processes.
systemctl: Manages and checks the status of system services.
Process Management: Starting, stopping, and restarting services.
Disk Usage Monitoring: Alerts for high disk usage.
Feel free to modify these scripts according to your specific requirements and environment.
11. List Services and Their Status
bash
Copy code
#!/bin/bash

# Usage: ./list_services.sh

echo "List of all services and their status:"
systemctl list-units --type=service --state=running

12. Check CPU Usage
bash
Copy code
#!/bin/bash

# Usage: ./cpu_usage.sh

echo "CPU usage:"
top -bn1 | grep "Cpu(s)"

13. Find Large Files in a Directory
bash
Copy code
#!/bin/bash

# Usage: ./find_large_files.sh /path/to/directory size_in_mb

DIRECTORY=$1
SIZE=$2

if [ -z "$DIRECTORY" ] || [ -z "$SIZE" ]; then
    echo "Usage: $0 /path/to/directory size_in_mb"
    exit 1
fi

echo "Files larger than $SIZE MB in $DIRECTORY:"
find "$DIRECTORY" -type f -size +"$SIZE"M -exec ls -lh {} \;

14. Backup a Directory
bash
Copy code
#!/bin/bash

# Usage: ./backup.sh /path/to/directory /path/to/backup/location

SOURCE=$1
DEST=$2
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$DEST/backup_$TIMESTAMP.tar.gz"

if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
    echo "Usage: $0 /path/to/directory /path/to/backup/location"
    exit 1
fi

echo "Creating backup of $SOURCE at $BACKUP_FILE"
tar -czf "$BACKUP_FILE" "$SOURCE"

15. Check for Root Privileges
bash
Copy code
#!/bin/bash

# Usage: ./check_root.sh

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
else
    echo "You are running as root."
fi

16. Find and Kill a Process by Name
bash
Copy code
#!/bin/bash

# Usage: ./kill_process.sh process_name

PROCESS_NAME=$1

if [ -z "$PROCESS_NAME" ]; then
    echo "Usage: $0 process_name"
    exit 1
fi

PID=$(pgrep "$PROCESS_NAME")

if [ -n "$PID" ]; then
    echo "Killing process $PROCESS_NAME with PID $PID"
    kill "$PID"
else
    echo "Process $PROCESS_NAME not found."
fi

17. Monitor Log File for Specific Events
bash
Copy code
#!/bin/bash

# Usage: ./monitor_log.sh /path/to/logfile search_term

LOGFILE=$1
SEARCH_TERM=$2

if [ -z "$LOGFILE" ] || [ -z "$SEARCH_TERM" ]; then
    echo "Usage: $0 /path/to/logfile search_term"
    exit 1
fi

echo "Monitoring $LOGFILE for occurrences of $SEARCH_TERM"
tail -F "$LOGFILE" | grep --line-buffered "$SEARCH_TERM"

18. Schedule a Script to Run Periodically
bash
Copy code
#!/bin/bash

# Usage: ./schedule_script.sh /path/to/script cron_expression

SCRIPT=$1
CRON_EXPRESSION=$2

if [ -z "$SCRIPT" ] || [ -z "$CRON_EXPRESSION" ]; then
    echo "Usage: $0 /path/to/script cron_expression"
    exit 1
fi

# Add to crontab
(crontab -l; echo "$CRON_EXPRESSION $SCRIPT") | crontab -
echo "Scheduled $SCRIPT to run with cron expression $CRON_EXPRESSION"

19. Compare Two Files
bash
Copy code
#!/bin/bash

# Usage: ./compare_files.sh file1 file2

FILE1=$1
FILE2=$2

if [ -z "$FILE1" ] || [ -z "$FILE2" ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

echo "Comparing $FILE1 and $FILE2"
diff "$FILE1" "$FILE2"

20. Get System Uptime
bash
Copy code
#!/bin/bash

# Usage: ./system_uptime.sh

echo "System uptime:"
uptime -p

Summary of Concepts:
Service Management: Listing services and their status.
Resource Monitoring: CPU usage, large files, and system uptime.
File Operations: Finding large files, backups, and comparing files.
Process Management: Finding and killing processes.
Privilege Checking: Verifying root privileges.
Log Monitoring: Searching logs for specific events.
Scheduling: Adding scripts to cron for periodic execution.
These scripts cover a range of administrative tasks and are meant to be starting points. You can customize them further based on your specific needs and environment.
24. Create a User with a Specific Shell
bash
Copy code
#!/bin/bash

# Usage: ./create_user.sh username shell

USERNAME=$1
SHELL=$2

if [ -z "$USERNAME" ] || [ -z "$SHELL" ]; then
    echo "Usage: $0 username shell"
    exit 1
fi

sudo useradd -m -s "$SHELL" "$USERNAME"
echo "User $USERNAME created with shell $SHELL"

25. Change User Password
bash
Copy code
#!/bin/bash

# Usage: ./change_password.sh username new_password

USERNAME=$1
NEW_PASSWORD=$2

if [ -z "$USERNAME" ] || [ -z "$NEW_PASSWORD" ]; then
    echo "Usage: $0 username new_password"
    exit 1
fi

echo "$USERNAME:$NEW_PASSWORD" | sudo chpasswd
echo "Password for $USERNAME changed."

26. Archive and Compress Files
bash
Copy code
#!/bin/bash

# Usage: ./archive_files.sh /path/to/files /path/to/archive.tar.gz

SOURCE_DIR=$1
ARCHIVE_FILE=$2

if [ -z "$SOURCE_DIR" ] || [ -z "$ARCHIVE_FILE" ]; then
    echo "Usage: $0 /path/to/files /path/to/archive.tar.gz"
    exit 1
fi

echo "Archiving and compressing $SOURCE_DIR into $ARCHIVE_FILE"
tar -czf "$ARCHIVE_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

27. Sync Directories Using rsync
bash
Copy code
#!/bin/bash

# Usage: ./sync_directories.sh /source/dir /destination/dir

SOURCE=$1
DEST=$2

if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
    echo "Usage: $0 /source/dir /destination/dir"
    exit 1
fi

echo "Syncing $SOURCE to $DEST"
rsync -avz "$SOURCE" "$DEST"

28. Generate a Random Password
bash
Copy code
#!/bin/bash

# Usage: ./generate_password.sh length

LENGTH=$1

if [ -z "$LENGTH" ]; then
    LENGTH=12
fi

echo "Generated password:"
openssl rand -base64 $LENGTH

29. Monitor Disk I/O Performance
bash
Copy code
#!/bin/bash

# Usage: ./disk_io.sh

echo "Disk I/O performance:"
iostat -x

30. Check for Open Ports
bash
Copy code
#!/bin/bash

# Usage: ./check_ports.sh

echo "Open ports:"
ss -tuln

Summary of Concepts:
Disk and Memory Usage: Checking available disk space and memory usage.
Network Connections: Listing active network connections.
User Management: Creating users, changing passwords.
File Operations: Archiving, compressing, and syncing directories.
Password Generation: Generating secure passwords.
Performance Monitoring: Disk I/O and checking open ports.
These scenarios encompass a wide range of administrative tasks and system checks that are essential for maintaining and managing systems in a DevOps environment. Each script can be tailored to suit specific requirements and can be extended with additional logic as needed.
31. Replace Text in a File Using sed
bash
Copy code
#!/bin/bash

# Usage: ./replace_text.sh file.txt "old_text" "new_text"

FILE=$1
OLD_TEXT=$2
NEW_TEXT=$3

if [ -z "$FILE" ] || [ -z "$OLD_TEXT" ] || [ -z "$NEW_TEXT" ]; then
    echo "Usage: $0 file.txt 'old_text' 'new_text'"
    exit 1
fi

sed -i "s/$OLD_TEXT/$NEW_TEXT/g" "$FILE"
echo "Replaced '$OLD_TEXT' with '$NEW_TEXT' in $FILE"

32. Extract Columns from a CSV File Using awk
bash
Copy code
#!/bin/bash

# Usage: ./extract_columns.sh file.csv 1 3

FILE=$1
COL1=$2
COL2=$3

if [ -z "$FILE" ] || [ -z "$COL1" ] || [ -z "$COL2" ]; then
    echo "Usage: $0 file.csv column1 column2"
    exit 1
fi

awk -F, "{print \$${COL1}},\t\$${COL2}" "$FILE"

33. Search for a Pattern in Files Using grep
bash
Copy code
#!/bin/bash

# Usage: ./search_pattern.sh "pattern" /path/to/files

PATTERN=$1
DIR=$2

if [ -z "$PATTERN" ] || [ -z "$DIR" ]; then
    echo "Usage: $0 'pattern' /path/to/files"
    exit 1
fi

grep -rnw "$DIR" -e "$PATTERN"

34. Find and Delete Files Older Than 30 Days Using find
bash
Copy code
#!/bin/bash

# Usage: ./cleanup_old_files.sh /path/to/directory

DIR=$1

if [ -z "$DIR" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

find "$DIR" -type f -mtime +30 -exec rm {} \;
echo "Deleted files older than 30 days in $DIR"

35. Count the Number of Lines in Each File Using awk
bash
Copy code
#!/bin/bash

# Usage: ./count_lines.sh /path/to/files

DIR=$1

if [ -z "$DIR" ]; then
    echo "Usage: $0 /path/to/files"
    exit 1
fi

awk 'END { print FILENAME ": " NR " lines" }' $DIR/*

36. Replace Multiple Words in a File Using sed
bash
Copy code
#!/bin/bash

# Usage: ./replace_multiple.sh file.txt "old1:new1 old2:new2"

FILE=$1
REPLACEMENTS=$2

if [ -z "$FILE" ] || [ -z "$REPLACEMENTS" ]; then
    echo "Usage: $0 file.txt 'old1:new1 old2:new2'"
    exit 1
fi

for REPLACEMENT in $REPLACEMENTS; do
    OLD_TEXT=$(echo $REPLACEMENT | cut -d':' -f1)
    NEW_TEXT=$(echo $REPLACEMENT | cut -d':' -f2)
    sed -i "s/$OLD_TEXT/$NEW_TEXT/g" "$FILE"
done

echo "Replacements made in $FILE"

37. Find Large Files and Directories Using find
bash
Copy code
#!/bin/bash

# Usage: ./find_large_files.sh /path/to/dir 100M

DIR=$1
SIZE=$2

if [ -z "$DIR" ] || [ -z "$SIZE" ]; then
    echo "Usage: $0 /path/to/dir size"
    exit 1
fi

find "$DIR" -type f -size +$SIZE

38. Filter Lines Containing a Specific Word Using grep
bash
Copy code
#!/bin/bash

# Usage: ./filter_lines.sh "word" file.txt

WORD=$1
FILE=$2

if [ -z "$WORD" ] || [ -z "$FILE" ]; then
    echo "Usage: $0 'word' file.txt"
    exit 1
fi

grep "$WORD" "$FILE"

39. Extract Lines with a Specific Pattern and Save to a New File Using grep
bash
Copy code
#!/bin/bash

# Usage: ./extract_lines.sh "pattern" file.txt output.txt

PATTERN=$1
FILE=$2
OUTPUT=$3

if [ -z "$PATTERN" ] || [ -z "$FILE" ] || [ -z "$OUTPUT" ]; then
    echo "Usage: $0 'pattern' file.txt output.txt"
    exit 1
fi

grep "$PATTERN" "$FILE" > "$OUTPUT"
echo "Extracted lines containing '$PATTERN' to $OUTPUT"

40. Print Line Number and Content Using awk
bash
Copy code
#!/bin/bash

# Usage: ./print_line_numbers.sh file.txt

FILE=$1

if [ -z "$FILE" ]; then
    echo "Usage: $0 file.txt"
    exit 1
fi

awk '{print NR ": " $0}' "$FILE"

Summary of Concepts:
Text Replacement: Using sed for in-place text replacement.
Column Extraction: Using awk to extract specific columns from a CSV file.
Pattern Searching: Using grep to search for patterns in files.
File Management: Using find to locate and delete old files.
Line Counting: Using awk to count lines in files.
Multiple Replacements: Using sed to perform multiple text replacements.
Large Files: Using find to locate large files or directories.
File Filtering: Using grep to filter and extract lines from files.
These scripts cover a range of common tasks that are useful in a DevOps environment, including file manipulation, searching, and monitoring.
4o mini



