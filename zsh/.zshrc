# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

# Zsh Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Alias definition
if [ -f "$HOME/.zshrc_aliases" ]
then
	source $HOME/.zshrc_aliases
fi

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
	local src_dir="$HOME/Liferay/ee-6.2.x/ee-plugins/portlets/loop-portlet/docroot/js/dist"
	local dst_dir="$HOME/Liferay/ee-6.2.x/bundles/tomcat-7.0.62/webapps/loop-portlet/js/dist"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Adding autocomplete for 'we'
[ -f ~/.we_autocomplete ] && source ~/.we_autocomplete
