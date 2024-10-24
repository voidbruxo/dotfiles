#!/bin/bash

while true; do
    find /home/"$(whoami)"/Pictures/wall -type f -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.gif" | shuf -n 1 | xargs feh --bg-fill
    sleep 1h

done
