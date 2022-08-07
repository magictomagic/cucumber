#!/bin/bash
pid_id=$(ps -ef| grep -E wf-recorder | grep -v grep | awk '{print $2}')

# pid_id=$(echo $recorder_line | awk '{print $2}')

echo "current id: $pid_id"

pid_num=$(echo $pid_id | awk '{print NF}')

echo "current records: $pid_num"

if [ $pid_num -gt 1 ]
then
  notify-send "More than one wf-recorder"
  kill -9 $pid_id
  notify-send "Abnormal wl-recorder pids: $pid_id, pids have been killed"
  exit
fi

if [ $pid_num -eq 1 ]
then
  # kill recorder
  pkill -f --signal INT wf-recorder && notify-send --expire-time=1000 "Screen recorded"
else
  # start recorder Pid $(pid_id)
  notify-send --expire-time=1000 "Start recording..."
  pid_id=$(wf-recorder --audio --file=$(date +'%Y-%m-%d-%H-%M-%S').mp4 &)
fi

