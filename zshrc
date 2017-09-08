####
# Junhao's zsh config
####

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="custom"

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
plugins=(git python pip zsh-syntax-highlighting)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/junhao/.rvm/bin:/home/junhao/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='emacs -nw'

# May need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

####
# Aliases and variables
####

alias -g emacs='emacs -nw'
alias -g racket='/usr/racket/bin/racket'

alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias -g L='| less'
alias -g TL='| tail -20'
alias -g NIL="> /dev/null 2>&1"

# List direcory contents
alias l='ls -CF'
alias ll='ls -Al'
alias la='ls -A'

####
# Scripts
####

# Updates time displayed in the prompt every second
promptTime() {
		emulate -L zsh
		zmodload -i zsh/sched
		# Remove existing event, so that multiple calls to `promptTime` work.
		integer i=${"${(@)zsh_scheduled_events#*:*:}"[(I)promptTime]}
		(( i )) && sched -$i
		# Test that zle is running before calling the widget
		# Otherwise update on entry to zle
		zle && zle reset-prompt
p		# Increment time by a second
		sched +1 promptTime
}
#promptTime

# Color
eval `dircolors $HOME/.dircolors`
