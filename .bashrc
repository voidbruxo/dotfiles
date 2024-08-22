# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# alias homies
alias neofetch="fastfetch"
alias update="sudo emerge -avuUND --changed-use --with-bdeps=y --binpkg-respect-use=y @world"
alias firefox="firefox-bin"
alias bat-info="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias paclist="sudo eix-installed all | less"
alias sys-time="stat / | awk '/Birth: /{print }' $argv"
alias ls="lsd"

# export homies
export EDITOR=vim
export VISUAL=vim
export TERM="xterm-256color"
export PATH="/home/geek/.local/bin/:$PATH"
export PATH="/home/geek/.config/emacs/bin/:$PATH"
source ~/.config/git-prompt.sh

#my prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;255;48;5;104;1;3m\]\u\[\e[0;1;48;5;98m\]@\[\e[48;5;132;3m\]\h\[\e[23;48;5;241m\]#\[\e[22m\]\w\[\e[38;5;255;48;5;28m\]${PS1_CMD1}\[\e[0;38;5;148;1m\]\$\[\e[0m\]'
