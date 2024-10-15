#!/usr/bin/env bash

# Read theme
THEME_FILE=/tmp/hypr-theme
if [ ! -f $THEME_FILE ]; then
	echo "default" > $THEME_FILE
fi
THEME=`cat $THEME_FILE`

# Parse args
if [[ "$#" -ne 0 ]]; then
	if [[ "$1" == "--toggle" ]] || [[ "$1" == "-t" ]]; then
		if [[ "$THEME" == "anime" ]]; then
			THEME="default"
		else
			THEME="anime"
		fi
	else
		# Use new theme if explicitly supplied
		THEME=$1
	fi
fi 

# Set wallpapers according to theme
if [[ "$THEME" == "anime" ]]; then
	echo $THEME > $THEME_FILE
	hyprctl hyprpaper preload "~/Pictures/wallpapers/arch-tan.png"
	hyprctl hyprpaper wallpaper ",~/Pictures/wallpapers/arch-tan.png"
else
	echo "default" > $THEME_FILE
	hyprctl hyprpaper preload "~/Pictures/wallpapers/arch.png"
	hyprctl hyprpaper wallpaper ",~/Pictures/wallpapers/arch.png"
fi
