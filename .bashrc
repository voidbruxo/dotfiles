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
alias update-fix="doas emerge -avuUND --changed-use --with-bdeps=y --binpkg-respect-use=y @world"
alias firefox="firefox-bin"
alias bat-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias vim="nvim"
alias neko="/home/geek/.local/apps/nekoray/launcher&disown&exit"
alias grub-update="doas grub-mkconfig -o /boot/grub/grub.cfg"
alias paclist="doas eix-installed all | less"
alias chrome="/home/geek/.local/apps/ungoogled-chromium/chrome&disown&exit"
alias xonotic="prime-run /home/geek/.local/apps/games/Xonotic/xonotic-linux-glx.sh&disown&exit"
alias sys-time="stat / | awk '/Birth: /{print }' $argv"
alias ls="~/.local/bin/lsd"

# export homies
export EDITOR=/usr/bin/nvim
export TERM="xterm-256color"
export PATH="/home/geek/.local/bin/:$PATH"

#add .bin and subs as path

# Put your fun stuff here.
