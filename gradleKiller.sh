#!/bin/bash

$(notify-send "gradleKiller started")
regexp='^[0-9]+$'
killedProcesses=()
if ! [[ $1 =~ $regexp ]] ; then
    echo "Put number parameter"
    exit 1
else
    while true
    do
        pidsArray=($(pidof java))
        if [ ${#pidsArray[@]} -gt 1 ] ; then
            unset pidsArray[-1]
            pids_array_size=${#pidsArray[@]}
            for i in ${pidsArray[@]}
            do
                pid_state=($(ps -q $i -o state))
                if [ $pid_state == 'S' ] ; then
                    echo "$(date +'%H:%M:%S') - trying to kill $i"
                    killedProcesses+="$i | " 
                    kill ${i}
                else
                    echo "There is nothing to kill"
                fi
            $(notify-send "Killed processes - ${killedProcesses[@]}")
            unset killedProcesses
            done
        fi
        sleep $1
    done
fi