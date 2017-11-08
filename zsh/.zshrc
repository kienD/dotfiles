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

# Alias definition
if [ -f "$HOME/.zshrc_aliases" ]
then
	source $HOME/.zshrc_aliases
fi

# autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh autoload -U compinit && compinit -u

# Functions

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

# NVM
source /usr/share/nvm/init-nvm.sh

# Vim - disable Ctrl-S and Ctrl-Q in terminals
stty -ixon

# Adding autocomplete for 'we'
[ -f ~/.we_autocomplete ] && source ~/.we_autocomplete
