# if [[ $(tty) == "/dev/tty1" ]]; then
#    startx -- vt1
# fi

# dwm + matlab
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

if [[ -n "$WAYLAND_DISPLAY" ]]; then
	XDG_SESSION_TYPE=wayland
	QT_QPA_PLATFORM=wayland
	MOZ_ENABLE_WAYLAND=1
	ELECTRON_OZONE_PLATFORM_HINT=auto
else
	clear
fi
