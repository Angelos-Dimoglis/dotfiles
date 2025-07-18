#!/bin/bash

# TODO: add variable for ports and/or add complete multi-monitor support

# if another monitor is connected
if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
	# set it in the left of primary monitor
	xrandr \
	--output eDp-1  --mode 1920x1080 --rotate normal --primary \
	--output HDMI-1 --mode 1920x1080 --rotate normal --left-of eDP-1
fi

# set wallpaper
nitrogen --restore

# launch polybar(s)
$HOME/.config/polybar/launch.sh

# launch conky(s)
$HOME/.config/conky/launch.sh

# programs to launch on startup
flameshot &
sxhkd &

# terminate already running dunst instances
killall -q dunst

# wait until the processes have been shut down
while pgrep -u $UID -x dunst > /dev/null; do sleep 1; done

dunst &
