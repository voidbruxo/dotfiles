#!/bin/bash
/usr/bin/lxpolkit &
slstatus &
xscreensaver -nosplash &
feh --bg-tile /home/geek/Pictures/wall/space2.png &
#/usr/bin/emacs --daemon &
/usr/bin/picom --config /home/geek/.config/picom/picom.conf &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
#/usr/bin/artix-pipewire-launcher &
