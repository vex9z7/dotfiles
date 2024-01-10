#!/bin/bash

setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&
notify-send "CapsLock is set to ctrl/xcape" 

notify-send ".profile is sourced" 
