#!/bin/bash

function ctrl_c {
    xrandr --output DP2-2-8 --mode 2560x1440 2> /dev/null
    exit
}

trap ctrl_c INT

xrandr --output DP2-2-8 --mode 1024x768 2> /dev/null
xrandr --output DP2-2-8 --set "scaling mode" "Center" 2> /dev/null

prime-run steam &

while true; do sleep 3600s; done
