#!/bin/bash

echo "enter 3 numbers"
read a b c

if [ $# -ne 3 ]; then   
   echo "enter exactly 3 numbers"
   ./big3.sh
   if [ $? -ne 0 ]; then
      exit 1;
   fi
fi

if [[ $a -gt $b && $a -gt $c ]]; then
   echo "$a is big"
elif [ $b -gt $c ]; then
   echo "$b is big"
else
   echo "$c is big" 
fi
