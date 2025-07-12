#!/bin/sh

# NOTE: I dont use this, I may find some better way to do this

# Send a notification displaying that the battery is charging or discharging
# Pass 1 as an argument for charging, 0 for discharging
# Example usage: chargingnotify 1

# Check if argument is passed
if [ $# != 1 ]; then
    printf '0 or 1 must be passed as an argument.\nUsage: %s 0|1\n' "$0" 
    exit
fi

export XAUTHORITY=/run/user/1000/Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_CHARGING=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

# Send notifications
if [ "$BATTERY_CHARGING" -eq 1 ]; then
    dunstify -a "charging_notify" -u low -t 5000 -r 9991 \
    -i "battery_charging" "Charging" "${BATTERY_LEVEL}% of battery charged."
elif [ "$BATTERY_CHARGING" -eq 0 ]; then
    dunstify -a "charging_notify" -u low -t 5000 -r 9991 \
    -i "battery" "Discharging" "${BATTERY_LEVEL}% of battery remaining."
fi
