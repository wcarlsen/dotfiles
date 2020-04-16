# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

plugins=(git kubectl aws tmux thefuck autojump fzf-tab)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR=nvim

# Aliases
source $HOME/.aliasrc

# Kubernetes contexts
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

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Remove duplicates and secrets from history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

export HISTORY_IGNORE="(cat|AWS|SECRET|KEY)"
