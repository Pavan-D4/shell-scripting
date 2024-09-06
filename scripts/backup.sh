#!/bin/bash

SOURCE_LOC="/home/ec2-user/work"
BACKUP_LOC="/home/ec2-user/backup"

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
DEST_LOC="$BACKUP_LOC/backup-$TIMESTAMP"

mkdir -p $BACKUP_LOC

cp -r $SOURCE_LOC $DEST_LOC

echo "Backup completed at $DEST_LOC"
