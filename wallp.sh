#!/bin/bash

WALL_DIR=~/Pictures/wall

while true; do
	WALLPAPER=$(ls $WALL_DIR | shuf -n 1)
	feh --bg-tile $WALL_DIR/$WALLPAPER
	sleep 3600
done
