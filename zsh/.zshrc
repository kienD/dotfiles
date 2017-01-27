# Path to your oh-my-zsh installation.
export ZSH=/home/kdo/.oh-my-zsh


# ZSH_THEME="ys"
ZSH_THEME="agnoster"

# ZSH Auto-update in days
export UPDATE_ZSH_DAYS=13

# Display command execution time
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
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

# NPM
# NPM_PACKAGES="${HOME}/.npm-packages"
#
# PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config

# Exports
export JAVA_HOME="/usr/lib/jvm/java-7-oracle/jre"

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export NVM_DIR="/home/kdo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export HOSTNAME=${HOSTNAME}

# Always use java7
export PATH=$PATH:~/bin:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin
# export PATH="/home/kdo/.nvm/versions/node/v0.12.0/bin:/home/kdo/.npm-packages/bin:/home/kdo/.npm-packages/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin"

# Ant
export ANT_OPTS="-Xms2048m -Xmx4096m -XX:PermSize=2048m -XX:MaxPermSize=2048m"

# Java
export JAVA_OPTS="-Xms512m -Xmx512m -XX:PermSize=256m -XX:MaxPermSize=256m"

# Android Studio
export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
# Adding autocomplete for 'we'
[ -f ~/.we_autocomplete ] && source ~/.we_autocomplete
