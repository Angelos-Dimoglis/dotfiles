#!/usr/bin/env bash

# Location: /usr/lib/systemd/system-sleep/

user="Angelos_the_IV"
uid=$(id -u "$user")

case $1 in
  post)
    xauth=$(ps aux | grep -oP '(?<=-auth )\S+' | head -n1)
    dbus_addr="unix:path=/run/user/$uid/bus"

    su "$user" -c "DISPLAY=:0 XAUTHORITY=$xauth DBUS_SESSION_BUS_ADDRESS=$dbus_addr betterlockscreen -l --show-layout" >> /tmp/sleep-hook.log 2>&1
    ;;
esac
