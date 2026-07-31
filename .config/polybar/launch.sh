#!/usr/bin/env bash

SECONDARY="HDMI-1"

# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

CONFIG=$HOME/.config/polybar/config.ini

# launch primary bar
polybar bar --config=$CONFIG &

# if another monitor is connected
if xrandr -q | grep -qw "${SECONDARY} connected"; then
	# launch external bar
    sleep 1
    polybar external --config=$CONFIG
fi
