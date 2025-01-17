#!/bin/bash

# Define the paths to your IR and US layouts
IR_LAYOUT="ir"
US_LAYOUT="us"

# Check the current layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between IR and US layouts
if [ "$current_layout" == "$IR_LAYOUT" ]; then
    setxkbmap $US_LAYOUT
else
    setxkbmap $IR_LAYOUT
fi
