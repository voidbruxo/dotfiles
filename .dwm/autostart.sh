#!/bin/bash
slstatus &
~/.config/wallp.sh &
picom &
wmname LG3D &
pkttyagent &
lxqt-policykit-agent &
/usr/bin/emacs --daemon &
unclutter --start-hidden --timeout 7s

