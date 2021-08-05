# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
# zstyle ':vcs_info:*' enable git

# autoload -U promptinit && promptinit
# prompt fade red

plugins=(git autojump kubectl aws tmux thefuck terraform history zsh-autosuggestions fzf fzf-tab tmuxinator)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR=nvim

# Aliases
source $HOME/.aliasrc

# Kubernetes contexts
export KUBECONFIG=$(ls $HOME/.kube/config* | tr '\n' ':')
export do="--dry-run=client -o yaml"

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Poetry
export POETRY_VIRTUALENVS_IN_PROJECT=1

# Pip tooling
export PATH=$PATH:$HOME/.local/bin

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
