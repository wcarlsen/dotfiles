export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
#DEFAULT_USER="$USER"

plugins=(
	autojump
	aws
	git
	kubectl
	osx
	thefuck
	docker
	tmux
)

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliasrc

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Kubectx
export KUBECONFIG=$HOME/.kube/config_hellman:$HOME/.kube/config_nonprod:$HOME/.kube/config_coke:$HOME/.kube/config_saml:$HOME/.kube/config_testpelle

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export PATH=$PATH:/home/wcarlsen/bin

if hash az 2>/dev/null; then
	source '/home/wcarlsen/lib/azure-cli/az.completion'
fi
