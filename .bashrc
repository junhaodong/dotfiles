# .bashrc
# bashrc is for aliases, functions, and shell configuration intended for use in
# interactive shells.  However, in some circumstances, bash sources bashrc even
# in non-interactive shells (e.g., when using scp), so it is standard practice
# to check for interactivity at the top of .bashrc and return immediately if
# the shell is not interactive.  The following line does that; don't remove it!
[[ $- != *i* ]] && return

# Load CentOS stuff and Facebook stuff (don't remove these lines).
source /etc/bashrc
source /usr/facebook/ops/rc/master.bashrc

# Keep oodles of command history (see https://fburl.com/bashhistory).
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Enforce a safer 'sudo rm' for interactive sessions (https://fburl.com/workplace/pbo3xan0)
if [[ $- == *i* ]]; then
    sudo() {
        if [ "$1" = "rm" ]; then
            shift
            command sudo rm --preserve-root=all --one-file-system "$@"
        else
            command sudo "$@"
        fi
    }
fi

#
# Set up personal aliases, functions, etc.  See https://fburl.com/bash.
# ...(put your own stuff here!)...
#

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
				# We have color support; assume it's compliant with Ecma-48
				# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
				# a case would tend to support setf rather than setaf.)
				color_prompt=yes
    else
				color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
		xterm*|rxvt*)
				PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
				;;
		*)
				;;
esac

# Local alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features
# Not necessary if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
		if [ -f /usr/share/bash-completion/bash_completion ]; then
				. /usr/share/bash-completion/bash_completion
		elif [ -f /etc/bash_completion ]; then
				. /etc/bash_completion
		fi
fi

# Enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

####
# More aliases and variables
####

# Misc aliases
alias ll='ls -Al'
alias la='ls -A'
alias l='ls -CF'

alias mkdir='mkdir -p'

alias emacs='emacs -nw'

# Directory shortcuts
alias -- -='cd -'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'

# Git
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gdt='git difftool'
alias gcmsg='git commit -am'
alias ga='git add'
. /home/junhao/local/fbsource/whatsapp/server/erl/tools/waserver_bashrc
export COLORTERM=truecolor
export CLAUDE_CODE_USE_GCP_DIRECT=1
