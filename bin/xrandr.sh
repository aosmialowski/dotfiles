#!/usr/bin/bash

PRIMARY="eDP-1"
EXT="HDMI-1"

if (xrandr | grep "$EXT connected"); then
    xrandr --output $PRIMARY --primary --mode 1366x768 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal
else
    xrandr --output $EXT --off
    xrandr --output $PRIMARY --primary --mode 1366x768 --pos 0x1080 --rotate normal
fi
