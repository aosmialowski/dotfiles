#!/usr/bin/bash

PRIMARY="eDP1"
EXT="HDMI1"

if (xrandr | grep "$EXT connected"); then
  #xrandr --output HDMI2 --off --output $PRIMARY --primary --mode 1366x768 --pos 0x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate 
  xrandr --output HDMI2 --off --output $EXT --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output $PRIMARY --mode 1366x768 --pos 0x1080 --primary --rotate normal --output VIRTUAL1 --off
else
  xrandr --output $EXT --off
  xrandr --output $PRIMARY --primary --mode 1366x768 --pos 0x1080 --primary --rotate normal
fi
