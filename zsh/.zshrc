# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

plugins=(
	autojump
	aws
	git
	kubectl
	osx
	thefuck
	vi-mode
)

source $ZSH/oh-my-zsh.sh

source ~/.aliasrc

export PIPENV_VENV_IN_PROJECT=1

# Hub
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
	FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi
