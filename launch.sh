#!/bin/sh

#Terminate any existing bar instances
killall -q polybar

# Wait until the processes are shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar with default configuration located at ~/.config/polybar/config on all monitors
for m in $(polybar --list-monitors | cut -d":" -f1) ; do
	MONITOR=$m polybar --reload example 2> ~/.logs/polybar.log &
done
