#!/usr/bin/env sh

## Add this to your wm startup file.


export POLYBAR_HOME=~/.config/polybar

# Terminate already running bar instances
# killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini --reload main &
polybar -c ~/.config/polybar/config.ini --reload secondary &
polybar -c ~/.config/polybar/config.ini --reload tertiary &
