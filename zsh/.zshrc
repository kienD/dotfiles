# Path to your oh-my-zsh installation.
export ZSH=/home/kdo/.oh-my-zsh

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

# autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh autoload -U compinit && compinit -u

# Alias definitions
if [ -f "$HOME/.zshrc_aliases" ]
then
	source $HOME/.zshrc_aliases
fi

# Functions

# Submit pull-request
function submit-pr {
	pipeVal=$(< /dev/stdin);

	branch=$(get_branch)

	if [ "$2" ]; then
		branch="$2"
	fi

	if [ "$1" ]; then
		gh pr --submit "$1" --title "$pipeVal" --description 'Jira Issue: '"[$branch](https://issues.liferay.com/browse/$branch)"'';
	else
		echo -e "Please enter correct format $fg_bold[red]submit <USER> <BRANCH>$reset_color"
	fi
}

function get-branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# function lsl {
# 	local src_dir="$HOME/Liferay/ee-plugins/portlets/loop-portlet/docroot"
# 	local dst_dir="$HOME/Liferay/ee-bundles/tomcat/webapps/loop-portlet/"

# 	recursiveHardLink $src_dir $dst_dir
# }

# function recursiveHardLink {
# 	for file in "$1"/*; do
# 		local filename=${file##*/}
# 		local dst="$2$filename"

# 		if [ -d $file ]
# 		then
# 			recursiveHardLink "$file" "$dst/"
# 		else
# 			[ -e "$dst" ] && rm "$dst"

# 			echo "Linking $filename"
# 			ln -f "$file" "$dst"
# 		fi
# 	done
# }

# Loop
function copyLoopJsp {
	local src_dir="$HOME/Liferay/ee-plugins/portlets/loop-portlet/docroot"
	local dst_dir="$HOME/Liferay/ee-bundles/tomcat/webapps/loop-portlet/"

	copyJsp $src_dir $dst_dir
}

function copyJsp {
	for file in "$1"/*; do
		local filename=${file##*/}
		local dst="$2$filename"

		if [ -d $file ]
		then
			copyJsp "$file" "$dst/"
		elif [[ $file == *.jsp  ]]
		then
			[ -e "$dst" ] && rm "$dst"

			echo "Copying $filename"
			cp "$file" "$dst"
		fi
	done
}

function lsl {
	local src_dir="$HOME/Liferay/ee-plugins/portlets/loop-portlet/docroot/js/dist"
	local dst_dir="$HOME/Liferay/ee-bundles/tomcat/webapps/loop-portlet/js/dist"

	for file in "$src_dir"/*; do
		local filename=${file##*/}
		local dst="$dst_dir/$filename"

		[ -e "$dst" ] && rm "$dst"

		echo "Linking $filename"
		ln -f "$file" "$dst"
	done
}

# Vim - disable Ctrl-S and Ctrl-Q in terminals
stty -ixon
