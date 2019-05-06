export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

plugins=(
	autojump
	aws
	git
	kubectl
	osx
	thefuck
	#vi-mode
)

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliasrc

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
