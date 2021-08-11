# Set default Editor to VIM
export BROWSER=firefox
export TERM=kitty
export TERMINAL=kitty
export VISUAL=vim

export EDITOR="$VISUAL"


# Exports
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:$HOME/Packages/rancher-v2.2.0
export PATH=$PATH:$HOME/Liferay/portal-commit-patcher
export PATH=$PATH:$HOME/Projects/jira-pr-tool

export ANT_OPTS="-Xms4g -Xmx4g"
export HOSTNAME=${HOSTNAME}
# export IDEA_JDK="/usr/lib/jvm/java-8-openjdk"
# export JAVA_OPTS="-Xms512m -Xmx512m -XX:PermSize=256m -XX:MaxPermSize=256m"
# export JAVA_HOME="export JAVA_HOME=/usr/lib/jvm/default/bin"
export JAVA_HOME="/usr/lib/jvm/default"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export MANPAGER=/usr/bin/vimpager
