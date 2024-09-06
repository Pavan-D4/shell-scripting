#!/bin/bash

#Write a script that starts a background process that runs `sleep 60`, lists all running processes, and then kills the `sleep` process.


nohup sleep 120 &

sleep_pid=$!
pidof sleep

ps

kill -9 $sleep_pid

if [ $? -eq 0 ]; then
   echo "process id $sleep_pid is killed"
else
   echo "problem while runnig kill cmd"
fi

ps
