# Set default Editor to VIM
export BROWSER=google-chrome-stable
export VISUAL=vim

export EDITOR="$VISUAL"

# Exports
export PATH=$PATH:/home/kdo/scripts
export PATH=$PATH:/home/kdo/.gem/ruby/2.4.0/bin
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools


export ANT_OPTS="-Xms2048m -Xmx4096m -XX:PermSize=2048m -XX:MaxPermSize=2048m"
export HOSTNAME=${HOSTNAME}
export IDEA_JDK="/usr/lib/jvm/java-8-jdk"
export JAVA_OPTS="-Xms512m -Xmx512m -XX:PermSize=256m -XX:MaxPermSize=256m"
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk/jre"
export NVM_DIR="/home/kdo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
