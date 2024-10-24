#!/bin/sh
/usr/bin/picom --config ~/.config/picom/picom.conf &
/usr/bin/nitrogen --restore &
#/usr/bin/pipewire &
#/usr/bin/pipewire-pulse &
#/usr/bin/wireplumber &
#/usr/bin/artix-pipewire-launcher &
/usr/bin/lxpolkit &
/usr/bin/emacs --daemon &
