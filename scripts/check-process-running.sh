#!/bin/bash
#
PROCESS=$1

if pgrep $PROCESS > /dev/null
then
	echo "$PROCESS is running"
else
	echo "$PROCESS is not running"
fi
