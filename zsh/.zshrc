# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

# ZSH Auto-update in days
export UPDATE_ZSH_DAYS=14

# Variables

# Display command execution time
HIST_STAMPS="mm/dd/yyyy"

# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug plugins
zplug "djui/alias-tips"
zplug "paulirish/git-open", as:plugin
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# plugins=(alias-tips git git-open)

# User configuration
source $ZSH/oh-my-zsh.sh

# lab completion
source <(lab completion zsh)

# Zsh Completions
fpath=(/opt/homebrew/share/zsh-completions $fpath)

# Jump
eval "$(jump shell)"

# Alias definition
if [ -f "$HOME/.zshrc_aliases" ]
then
	source $HOME/.zshrc_aliases
fi

# Nvm
if [ -f /usr/share/nvm/init-nvm.sh ]
then
  source /usr/share/nvm/init-nvm.sh
fi

# Vim - disable Ctrl-S and Ctrl-Q in terminals
# stty -ixon

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden -s'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

IJ_CLONE_PATH=~/Liferay/liferay-intellij

ij() {
    ${IJ_CLONE_PATH}/intellij "$@"
}
