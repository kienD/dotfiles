# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

# ZSH Auto-update in days
export UPDATE_ZSH_DAYS=14

# Variables

# Display command execution time
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(alias-tips git git-open)

# User configuration
source $ZSH/oh-my-zsh.sh

# Zsh Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Alias definition
if [ -f "$HOME/.zshrc_aliases" ]
then
	source $HOME/.zshrc_aliases
fi

# Vim - disable Ctrl-S and Ctrl-Q in terminals
stty -ixon

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden -s'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
