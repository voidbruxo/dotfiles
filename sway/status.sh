#!/bin/bash
while true; do
  # Get brightness percentage
  brightness=$(brightnessctl g | awk '{print int($1/$(brightnessctl m)*100)}')
  # Get volume percentage
  volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1)
  # Get date and time
  date_time=$(date "+%Y-%m-%d")
  bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage" | awk '{print$2}')
  # Icons (replace with the correct Unicode code points for your chosen Nerd Font)
  vol_icon="" # FontAwesome volume icon
  brightness_icon="󰃠" # FontAwesome sun icon
  date_icon="" # FontAwesome calendar icon
  time_icon=""
  bat_icon="" # FontAwesome clock icon
  # Output the status line with icons
  echo "${bat_icon} ${bat} | ${brightness_icon} ${brightness}% | ${vol_icon}  ${volume} | ${date_icon} ${date_time} | ${time_icon} $(date '+%H:%M')"
  # Sleep for 1 second before updating again
  sleep 1
done
