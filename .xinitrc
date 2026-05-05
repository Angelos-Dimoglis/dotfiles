#!/usr/bin/env bash

flameshot &
sxhkd &
dunst &

exec i3
