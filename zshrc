# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="custom"

# Use case-sensitive completion.
# CASE_SENSITIVE="true"

# Disable auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=27

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Use another custom folder than $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# Load plugins (can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git python pip zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/junhao/.rvm/bin:/home/junhao/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='emacs -nw'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Define local aliases within the ZSH_CUSTOM folder.
alias emacs='emacs -nw'

alias .2='cd ../..'
alias .3='cd ../../..'

# Network variables
lisa='junhao.dong@149.89.160'
homer='junhao.dong@149.89.150'
bart='junhao.dong@149.89.151'
marge='junhao.dong@149.89.161'
