# Set default Editor to VIM
export BROWSER=firefox
# export TERM=xterm-kitty
# export TERMINAL=kitty
export VISUAL=vim

export EDITOR="$VISUAL"

# Exports
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/projects/hana/index.js
export PATH=$PATH:$HOME/.okta/bin
# export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
# export PATH=$PATH:$HOME/Packages/rancher-v2.2.0
# export PATH=$PATH:$HOME/.pyenv/shims/python3
# export PATH=$PATH:PYENV_ROOT/bin
# export PYTHONPATH="$HOME/.pyenv/shims/python3"
# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python3
# export VIRTUALENVWRAPPER_VIRTUALENV=/opt/homebrew/bin/virtualenv
# source /opt/homebrew/bin/virtualenvwrapper.sh

export ANT_OPTS="-Xms4g -Xmx4g"
export HOSTNAME=${HOSTNAME}
# export IDEA_JDK="/usr/lib/jvm/java-8-openjdk"
# export JAVA_OPTS="-Xms512m -Xmx512m -XX:PermSize=256m -XX:MaxPermSize=256m"
export JAVA_HOME="$(/usr/libexec/java_home)"
# export JAVA_HOME="/usr/lib/jvm/default"
# export JAVA_HOME=/Users/kdo/Library/Java/JavaVirtualMachines/azul-13.0.12/Contents/Home
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export MANPAGER=/opt/homebrew/bin/vimpager
