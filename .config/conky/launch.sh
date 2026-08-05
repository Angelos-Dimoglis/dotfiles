#!/usr/bin/env bash

# terminate already running conky instances
killall -q conky

# wait until the processes have been shut down
while pgrep -u $UID -x conky > /dev/null; do
    sleep 1
done

# launch conky
conky &
