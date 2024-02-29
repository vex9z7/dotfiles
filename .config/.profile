#!/bin/bash

killall xcape -q ; setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape' -t 250 &
notify-send "CapsLock is set to ctrl/xcape" 

notify-send ".profile is sourced" 
