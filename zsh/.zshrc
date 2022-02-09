# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

#autoload -U promptinit && promptinit
#prompt fade magenta

plugins=(git autojump kubectl aws tmux thefuck terraform history zsh-autosuggestions fzf fzf-tab tmuxinator direnv)

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR="emacsclient -n -a emacs"

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
# export MSBuildSDKsPath=$( echo /usr/share/dotnet/sdk/3.*/Sdks )

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

# Mcfly
eval "$(mcfly init zsh)"
