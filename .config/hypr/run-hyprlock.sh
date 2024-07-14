#!/usr/bin/env bash

# Read theme
THEME_FILE=/tmp/hypr-theme
if [ ! -f $THEME_FILE ]; then
	echo "default" > $THEME_FILE
fi
THEME=`cat $THEME_FILE`

# Run correct version based on theme
if [[ "$THEME" == "anime" ]]; then
	pidof hyprlock || hyprlock --config ~/.config/hypr/hyprlock-anime.conf
else
	pidof hyprlock || hyprlock
fi
