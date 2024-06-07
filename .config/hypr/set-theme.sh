#!/usr/bin/env bash

# Read theme
conf=~/.config/hypr/theme.conf
theme=`cat $conf`

if [[ "$#" -ne 0 ]]; then
	if [[ "$1" == "--toggle" ]] || [[ "$1" == "-t" ]]; then
		if [[ "$theme" == "anime" ]]; then
			theme="default"
		else
			theme="anime"
		fi
	else
		# Use new theme if explicitly supplied
		theme=$1
	fi
fi 


# Set wallpapers accordig to theme
if [[ "$theme" == "anime" ]]; then
	hyprctl hyprpaper preload "~/Pictures/wallpapers/arch-chan.png"
	hyprctl hyprpaper wallpaper ",~/Pictures/wallpapers/arch-chan.png"
else
	theme="default"
	hyprctl hyprpaper preload "~/Pictures/wallpapers/archbtw.png"
	hyprctl hyprpaper wallpaper ",~/Pictures/wallpapers/archbtw.png"
fi

# Write theme to save file
echo $theme > $conf
