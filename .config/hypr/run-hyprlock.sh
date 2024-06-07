#!/usr/bin/env bash

# Read theme
conf=~/.config/hypr/theme.conf
theme=`cat $conf`

# Run correct version based on theme
if [[ "$theme" == "anime" ]]; then
	pidof hyprlock || hyprlock --config ~/.config/hypr/hyprlock-anime.conf
else
	pidof hyprlock || hyprlock
fi
