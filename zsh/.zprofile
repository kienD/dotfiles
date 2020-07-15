export ANT_HOME="/usr/local/Cellar/ant/1.10.7/libexec"
export ANT_OPTS="-Xms3g -Xmx3g"
export PATH=$PATH:$ANT_HOME/bin:$JAVA_HOME/bin:

eval "$(hub alias -s)"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
