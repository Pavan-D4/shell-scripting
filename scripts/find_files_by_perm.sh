#!/bin/bash

# Write a script that finds all files in the `/home` directory that are executable by the owner but not by others.

echo "finding all files which has execute prmision to user bt not to owner"

reslts=$(find /home -type f -perm /u=x ! -perm /o=x)

if [ -z $results ]; then
   echo "ther is no files with specified permissions"
else
   echo "$results"
fi

echo "script is done."
