# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# ZINIT Config and plugins data store
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit IF not Dowloaded Already
if [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add God Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# ADD in spippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::docker

# Fix the Shitty Problem for zinit for docker
DIRECTORY="$HOME/.cache/zinit/completions/"
if [[ ! -d "$DIRECTORY" ]]; then
  # If it doesn't exist, create it
  mkdir -p "$DIRECTORY"
else
  clear
fi


# Load Completions
autoload -U compinit && compinit

zinit cdreplay -q

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd $realpath'

# Better Life (KeyBindings)
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# FZF is The Best (Integration)
eval "$(fzf --zsh)"

# ZOXIDE INIT 
eval "$(zoxide init zsh)"

# Alias Homies
source ~/.scripts/alias

# DIR PATH HOMIES
PATH="$HOME/.local/bin/:$PATH"
PATH="$HOME/.config/emacs/bin:$PATH"

# OH My Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"



