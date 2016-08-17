# Alias definitions

alias pls='sudo "$BASH" -c "$(history -p !!)"'

alias gitpr="source ~/Liferay/git-tools/git-pull-request/git-pull-request.sh"

alias apache='apache2ctl'

function gradle {
  local root_level=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -n "$root_level" && -f "$root_level/gradlew" ]]; then
    root_level="$root_level/gradlew"
  else
    root_level=$(which gradle)
 fi

  "$root_level" $@
}



# Ant
alias aa='ant all'
alias ad='ant deploy'
alias acd='ant clean deploy'

# Git
alias gs="git status"
alias gitk="/usr/bin/wish $(which gitk)"

# Lock screen
alias lock='py3lock.py'

# Alias "g" to "git" command, but preserving git-completion
alias g="git"
complete -o default -o nospace -F _git g

# Alias gh to git help
alias gh="git help"

alias sbp='source ~/.bash_profile'
alias sbrc='source ~/.bashrc'

alias java-kill='fuser -k 8080/tcp'