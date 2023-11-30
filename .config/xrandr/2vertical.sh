#!/usr/bin/bash
xrandr --output DP-3 --off

xrandr --output DP-1 --auto --pos 0x0 --rotate right --primary --scale 1x1
xrandr --output DP-4 --auto --rotate right --right-of DP-1 --scale 1x1

notify-send "The 2-vertical layout is set."
