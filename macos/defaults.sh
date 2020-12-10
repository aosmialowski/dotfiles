#!/usr/bin/env bash

if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

osascript -e 'tell application "System Preferences" to quit'

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

_DIR=$(dirname $0)

source $_DIR/activity_monitor.sh
source $_DIR/app_store.sh
source $_DIR/dock.sh
source $_DIR/general.sh
source $_DIR/finder.sh
source $_DIR/input.sh
source $_DIR/iterm2.sh
source $_DIR/mail.sh
source $_DIR/safari.sh
source $_DIR/screen.sh
