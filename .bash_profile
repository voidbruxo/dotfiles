# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export QT_AUTO_SCREEN_SCALE_FACTOR=1
	export QT_QPA_PLATFORM=wayland
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export GDK_BACKEND=wayland
	export XDG_CURRENT_DESKTOP=sway
	export GBM_BACKEND=nvidia-drm
	export __GLX_VENDOR_LIBRARY_NAME=nvidia
	export MOZ_ENABLE_WAYLAND=1
	export WLR_NO_HARDWARE_CURSORS=1
	export SWAYFLAGS="--unsupported-gpu"
else
	#xorg bro
	echo "not wayland"
fi
