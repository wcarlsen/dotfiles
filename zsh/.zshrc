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
	docker
	tmux
)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR=nvim

# Aliases
source ~/.aliasrc

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Kubectx
export KUBECONFIG=""
for entry in "$HOME/.kube"/*
do
	if [[ $entry = *config_* ]]
	then
	KUBECONFIG+="$entry"
	KUBECONFIG+=":"
	fi
done
export KUBECONFIG=${KUBECONFIG[1,-2]}

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


# Az-cli
export PATH=$PATH:/home/wcarlsen/bin

if hash az 2>/dev/null; then
	source '/home/wcarlsen/lib/azure-cli/az.completion'
fi

# Dotnet
export PATH=$PATH:$HOME/.dotnet/tools
export DOTNET_ROOT=/opt/dotnet
export MSBuildSDKsPath=/opt/dotnet/sdk/$(dotnet --version)/Sdks
