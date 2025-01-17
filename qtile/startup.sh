#!/bin/sh
/usr/bin/lxpolkit &
/usr/bin/emacs --daemon &
/usr/bin/picom --config /home/geek/.config/picom/picom.conf &
#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/wireplumber &
/usr/bin/artix-pipewire-launcher &
