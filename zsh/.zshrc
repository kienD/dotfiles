# Path to your oh-my-zsh installation.
export ZSH=/home/kdo/.oh-my-zsh

ZSH_THEME="ys"

# ZSH Auto-update in days
export UPDATE_ZSH_DAYS=14

# Variables

# Display command execution time
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(alias-tips git)

# User configuration
source $ZSH/oh-my-zsh.sh

# Alias definitions
if [ -f "$HOME/.zshrc_aliases" ]
then
	source $HOME/.zshrc_aliases
fi

# Functions
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