#!/usr/bin/env bash

PRIMARY="eDP-1"
SECONDARY="HDMI-1"

# if another monitor is connected
if xrandr -q | grep -qw "${SECONDARY} connected"; then
	xrandr \
	--output $PRIMARY --mode 1920x1080 --rotate normal --primary \
	--output $SECONDARY --mode 1920x1080 --rotate normal --left-of $PRIMARY
    sleep 0.5
else
	xrandr \
    --output $PRIMARY --mode 1920x1080 --rotate normal --primary \
    --output $SECONDARY --off
    sleep 0.5
fi

# set wallpaper
nitrogen --restore

# launch polybar(s)
"$HOME/.config/polybar/launch.sh"

# launch conky(s)
"$HOME/.config/conky/launch.sh"
