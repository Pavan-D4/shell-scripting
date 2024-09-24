#!/bin/bash

#Write a script that checks if a file exists and if it is readable, writable, or executable. The script should output a message for each condition.

file_nm=$1

if [ -z $file_nm ]; then
   echo "please pass file name syntax : $0 <filename>"
else
   if [ -e $file_nm ]; then
      echo "file exits"
      if [ -r $file_nm ]; then
	echo "file is readble"
      else 
         echo "file is not readable"
      fi
   fi
fi
