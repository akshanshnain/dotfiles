#!/bin/sh
if ! gputemp=$(nvidia-smi --format=nounits,csv,noheader --query-gpu=temperature.gpu | xargs echo); then
    gputemp=0
fi

gp=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "GPU",""$1"","%"}')

if [ "$gputemp" -gt 0 ]; then
    echo "$gp  $gputemp°C"
else
    echo "$no RTX2060 DISABLED"
fi
