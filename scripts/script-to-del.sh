#!/bin/bash

files_deleted=$(find /home/ec2-user/work -mmin +5)

echo "$files_deleted"
find /home/ec2-user/work -mmin +5 -exec rm -rf {} +

echo "Files and folders older than 5 minutes have been deleted from /home/ec2-user/work"
