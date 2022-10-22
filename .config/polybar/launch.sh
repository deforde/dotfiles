#!/usr/bin/env bash

polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
polybar -c $HOME/.config/polybar/config.ini mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "polybar launched..."
