#!/bin/bash

# terminate already running conky instances
killall -q conky

# wait until the processes have been shut down
while pgrep -u $UID -x conky > /dev/null; do sleep 1; done

# launch conky
conky

# if hdmi is connected
#if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
        # launch conky for the second monitor
        #conky
#fi
