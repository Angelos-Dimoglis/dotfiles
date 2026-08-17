#!/usr/bin/env bash

# FIX: Locking fails consistantly (maybe nvidia bug)

chosen=$1

if [ -z "$chosen" ]; then
    printf " Power Off\n Reboot\n󰒲 Suspend\n Lock"
    exit 0
fi

case "$chosen" in
    *"Power Off"*)
        poweroff 
        ;;
    *"Reboot"*)
        reboot
        ;;
    *"Suspend"*)
        systemctl suspend
        ;;
    *"Lock"*)
        betterlockscreen -l --show-layout
        ;;
    *)
        ;;
esac
