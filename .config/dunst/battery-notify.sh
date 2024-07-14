#!/usr/bin/env bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_PERCENTAGE=$(upower -i $(upower -e | grep "BAT0") | grep "percentage" | awk '{print substr($2, 1, length($2)-1)}')
BATTERY_STATE=$(upower -i $(upower -e | grep "BAT0") | grep "state" | awk '{print $2}')

# echo $BATTERY_PERCENTAGE
# echo $BATTERY_STATE

CRITICAL_LEVEL=15
WARNING_LEVEL=30
REMIND_LEVEL=50

#: Check if the notification is sent already. Current configuration will notify REMIND_LEVEL only once and 
#: other LEVELs as often as cron job is configured
#: 		Add file entries for WARNING_LEVEL and CRITICAL_LEVEL if you want them to display only once
BATTERY_REMIND_FILE=/tmp/battery-reminder

if [ $BATTERY_PERCENTAGE -le $CRITICAL_LEVEL ] && [ "$BATTERY_STATE" = "discharging" ]; then
	dunstify "CRITICAL BATTERY!" "${BATTERY_PERCENTAGE}% battery remaining!" -i "battery" -u critical 
elif [ $BATTERY_PERCENTAGE -le $WARNING_LEVEL ] && [ "$BATTERY_STATE" = "discharging" ]; then
	dunstify "Low Battery!" "${BATTERY_PERCENTAGE}% battery remaining!" -i "battery" -u normal 
elif [ $BATTERY_PERCENTAGE -le $REMIND_LEVEL ] && [ "$BATTERY_STATE" = "discharging" ] && [ ! -f $BATTERY_REMIND_FILE ]; then
	dunstify "Battery Info" "${BATTERY_PERCENTAGE}% battery remaining." -i "battery" -u low
	touch $BATTERY_REMIND_FILE
fi
