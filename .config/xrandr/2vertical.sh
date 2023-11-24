#!/usr/bin/bash
xrandr --output DP-3 --off

xrandr --output DP-1 --auto --scale 1x1 --pos 0x0 --rotate right --primary
xrandr --output DP-4 --auto --scale 1x1 --rotate right --right-of DP-1


notify-send "The 2-vertical layout is set."
