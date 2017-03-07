# Path to your oh-my-zsh installation.
export ZSH=/home/kdot/.oh-my-zsh

# Set default Editor to VIM
export VISUAL=vim
export EDITOR="$VISUAL"

ZSH_THEME="ys"

# ZSH Auto-update in days
export UPDATE_ZSH_DAYS=14

# Display command execution time
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(alias-tips git)

# User configuration
source $ZSH/oh-my-zsh.sh

# Exports
export PATH=$PATH:/home/kdot/scripts
export PATH=$PATH:/home/kdot/.gem/ruby/2.4.0/bin

export ANT_OPTS="-Xms2048m -Xmx4096m -XX:PermSize=2048m -XX:MaxPermSize=2048m"
export HOSTNAME=${HOSTNAME}
export JAVA_OPTS="-Xms512m -Xmx512m -XX:PermSize=256m -XX:MaxPermSize=256m"
export JAVA_HOME="/usr/lib/jvm/java-7-jdk/jre"
export NVM_DIR="/home/kdot/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Alias definitions
if [ -f "/home/kdot/.zshrc_aliases" ]
then
	source /home/kdot/.zshrc_aliases
fi
