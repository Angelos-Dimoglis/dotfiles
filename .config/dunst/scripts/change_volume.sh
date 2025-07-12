#!/bin/bash

send_notification() {
    volume=$(pamixer --get-volume)

    dunstify -a "change_volume" -u low -r 9993 -t 2000 \
    -h int:value:"$volume" -i "volume_$1" "Volume: ${volume}%"
}

case $1 in
    up)
        pamixer -u
        pamixer -i 5 --allow-boost
        send_notification "$1"
        ;;
    down)
        pamixer -u
        pamixer -d 5 --allow-boost
        send_notification "$1"
        ;;
    mute)
        pamixer -t
        if $(pamixer --get-mute); then
            dunstify -a "change_volume" -u low -r 9993 -t 2000 \
            -i "volume_mute" "Muted"
        else
            send_notification up
        fi
        ;;
esac
