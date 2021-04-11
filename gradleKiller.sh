#!/bin/bash

regexp='^[0-9]+$'
if ! [[ $1 =~ $regexp ]] ; then
    exit 1
else
    while true
    do
        pids_array=($(pidof java))
        if [ ${#pids_array[@]} -gt 1 ] ; then
            unset pids_array[-1]
            pids_array_size=${#pids_array[@]}
            for i in ${pids_array[@]}
            do
                pid_state=($(ps -q $i -o state))
                if [ $pid_state == 'S' ] ; then
                    kill ${i}
                fi
            done
        fi
        sleep $1
    done
fi




