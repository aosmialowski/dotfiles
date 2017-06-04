#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [[ $(hostname) == "workstation01" ]]; then
  xrandr \ 
	--output HDMI3 \
        --primary \
        --mode 1920x1080 \
        --pos 1920x0 \
        --rotate normal \
        --output HDMI2 \
        --mode 1920x1080 \
        --pos 3840x0 \
        --rotate normal \
        --output HDMI1 \
        --mode 1920x1080 \
        --pox 0x0 \
        --rotate normal \
        --output VIRTUAL1 \
        --off \
        --output DP1 \
        --off \
        --dpi 96
elif [[ $(hostname) == "workstation02" ]]; then
  xrandr \
        --output eDP-1 \
        --primary \
        --mode 1920x1080 \
        --pos 0x0 \
        --rotate normal \
        --output DP-1 \
        --off \
        --output HDMI-1 \
        --off \
        --output HDMI-2 \
        --off
        --dpi 96
fi

# start composite manager
if [[ $(hostname) == "workstation01" ]]; then
  compton -cb &
fi

# start removable media automounter
udiskie &

# demonize rxvt-unicode terminal emulator
urxvtd -q -f -o &

exec i3

