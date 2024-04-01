# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# alias homies
alias fetch="fastfetch"
alias neofetch="fastfetch"
alias sudo="doas"
alias update="doas emerge -avuUND @world"
alias update-fix="doas emerge --ask --verbose --update --deep --changed-use --with-bdeps=y --binpkg-respect-use=n @world"
alias firefox="firefox-bin"
alias bat-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias vim="nvim"
alias neko="/home/geek/apps/nekoray/launcher&disown&exit"
alias chrome="/home/geek/apps/ungoogled-chromium/chrome&disown&exit"
alias grub-update="doas grub-mkconfig -o /boot/grub/grub.cfg"
alias paclist="doas qlist -IRv | less"

# export homies
export EDITOR=/usr/bin/nvim
export TERM="xterm-256color"

#add .bin and subs as path
export PATH=$(find /home/geek/.bin -type d -printf "%p:" | tr -d '\n')$PATH

# Put your fun stuff here.
