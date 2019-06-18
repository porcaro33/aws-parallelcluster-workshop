#!/usr/bin/env bash

if [[ $(head -1 /sys/devices/system/cpu/cpu0/topology/thread_siblings_list) == "0-1" ]]; then
    echo Detected single core
    echo 0 > /sys/devices/system/cpu/cpu1/online
else
    echo Detected multiple cores
    for cpunum in $(cat /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | cut -s -d, -f2- | tr ',' '\n' | sort -un)
    do
	    echo 0 > /sys/devices/system/cpu/cpu$cpunum/online
    done
fi
