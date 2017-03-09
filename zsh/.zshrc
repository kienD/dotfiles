# Path to your oh-my-zsh installation.
export ZSH=/home/kdo/.oh-my-zsh

ZSH_THEME="ys"

# ZSH Auto-update in days
export UPDATE_ZSH_DAYS=14

# Display command execution time
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(alias-tips git)

# User configuration
source $ZSH/oh-my-zsh.sh

# Alias definitions
if [ -f "/home/kdo/.zshrc_aliases" ]
then
	source /home/kdo/.zshrc_aliases
fi
