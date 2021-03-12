#!/bin/bash

# DISPLAY=$(xrandr | grep 'connected primary' | awk '{ print $1 }')

xrandr --output DP2-8 --mode 1024x768
xrandr --output DP2-8 --set "scaling mode" "Center"
