#!/bin/bash
#
# USAGE:
# lock.sh "password" "Message to display, e.g. reason for leaving"
#
trap "" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
clear
bad=false
times=0
wait_time=2
while true
do
    echo ""
    echo ""
    echo ""
    echo ""
    echo ".------------------[" $2 $3 $4 $5 $6 $7 $8 $9 "| Failed attempts: $times ]-------->"
    if [ $bad == true ]; then
        echo "\`-----Password: ###Incorrect, please wait $wait_time seconds###"
        sleep $wait_time
        clear
        echo ""
        echo ""
        echo ""
        echo ""
        echo ".------------------[" $2 $3 $4 $5 $6 $7 $8 $9 "| Failed attempts: $times ]-------->"
    fi
    read -s -p "\`-----Password: " pass
    if [ "$pass" == "$1" ]; then
        break
    fi
    bad=true
    let times+=1
    wait_time=$(echo "2*$times+1" | bc)
    clear
done
clear
echo
