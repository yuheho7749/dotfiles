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
			THEME="meme"
		elif [[ "$THEME" == "meme" ]]; then
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
	hyprctl hyprpaper reload ",~/Pictures/wallpapers/arch-tan.png"
elif [[ "$THEME" == "meme" ]]; then
	echo $THEME > $THEME_FILE
	hyprctl hyprpaper reload ",~/Pictures/wallpapers/i-swear-its-only-a-meme.png"
else
	echo "default" > $THEME_FILE
	hyprctl hyprpaper reload ",~/Pictures/wallpapers/arch.png"
fi
