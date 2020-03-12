export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
plugins=(
	autojump
	aws
	git
	kubectl
	osx
	thefuck
	docker
	tmux
	#you-should-use
	fzf-tab
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

# Local bin
export PATH=$PATH:/home/wcarlsen/bin

# Az-cli
if hash az 2>/dev/null; then
	source '/home/wcarlsen/lib/azure-cli/az.completion'
fi

# Dotnet
#export DOTNET_ROOT=/opt/dotnet
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:$HOME/.dotnet/tools
#export MSBuildSDKsPath=/opt/dotnet/sdk/$(dotnet --version)/Sdks
export MSBuildSDKsPath=/usr/share/sdk/$(dotnet --version)/Sdks

# Fasd
#eval "$(fasd --init auto)"

# Fzf
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
