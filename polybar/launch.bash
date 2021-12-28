#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
config="polybar -q -c ~/Dotfiles/syntax-dots/polybar/config.ini"

# Wait until the processes have been shut down
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

# Launch bar
eval "$config main-bar" & disown

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
	eval "$config external-bar" & disown
fi

# vim:ft=bash:nowrap
