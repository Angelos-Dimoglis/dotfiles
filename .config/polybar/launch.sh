#!/bin/bash

# FIX: at launch time only one of the 2 bars start, when run again everything
# is fine

# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

CONFIG=$HOME/.config/polybar/config.ini

# launch primary bar
polybar bar --config=$CONFIG &

# if hdmi is connected
if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
	# launch external bar
	polybar external --config=$CONFIG &
fi
