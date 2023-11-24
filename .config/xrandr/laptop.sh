#!/usr/bin/bash
xrandr --output DP-1 --off
xrandr --output DP-4 --off

xrandr --output DP-3 --auto  --scale 1x1  --pos 0x0 --primary


notify-send "The laptop layout is set."
