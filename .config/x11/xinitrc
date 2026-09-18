#!/usr/bin/env bash

if [ -z "$XAUTHORITY" ]; then
    export XAUTHORITY=$HOME/.Xauthority
fi

touch "$XAUTHORITY"
xauth add "$(hostname)/unix:0" MIT-MAGIC-COOKIE-1 "$(mcookie)"

flameshot &
sxhkd &
dunst &

exec i3
