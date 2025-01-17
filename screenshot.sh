#!/bin/bash

# Generate a random name for the screenshot
filename=$(date +%s%N | md5sum | awk '{print $1}').png

# Take the screenshot using scrot with the random filename
scrot /home/"$(whoami)"//Pictures/screenshots/"$filename"
