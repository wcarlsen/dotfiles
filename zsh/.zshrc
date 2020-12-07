# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

plugins=(git kubectl aws tmux thefuck terraform history zsh-autosuggestions fzf-tab)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR=nvim

# Aliases
source $HOME/.aliasrc

# Kubernetes contexts
export KUBECONFIG=$(ls $HOME/.kube/config_* | tr '\n' ':')
export do="--dry-run=client -o yaml"

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Dotnet
export PATH=$PATH:$HOME/.dotnet/tools

# Remove duplicates and secrets from history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
export HISTORY_IGNORE="(cat|AWS|SECRET|KEY|base64|secret|export)"
