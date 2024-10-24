# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# export homies
export EDITOR=vim
export VISUAL=vim
export TERM="xterm-256color"
export PATH="/home/"$(whoami)"/.local/bin/:$PATH"
export PATH="/home/"$(whoami)"/.config/emacs/bin/:$PATH"
source ~/.config/git-prompt.sh
source ~/.scripts/alias

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#zoxide bash connection
eval "$(zoxide init bash)"

#my prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;255;48;5;104;1;3m\]\u\[\e[0;1;48;5;98m\]@\[\e[48;5;132;3m\]\h\[\e[23;48;5;241m\]#\[\e[22m\]\w\[\e[38;5;255;48;5;28m\]${PS1_CMD1}\[\e[0;38;5;148;1m\]\$\[\e[0m\]'
