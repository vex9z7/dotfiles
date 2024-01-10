#!/bin/bash

# TODO move the env variable to env

XDG_CONFIG_HOME="$HOME/.config"
DOTFILES=$(pwd)

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

ln -sf "$DOTFILES/X11/.xinitrc" "$HOME"
