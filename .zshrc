# .zshrc
# zshrc is sourced in interactive shells.  It should contain commands to set up
# aliases, functions, options, key bindings, etc.

# Load Facebook stuff (don't remove this line).
source /usr/facebook/ops/rc/master.zshrc

# Keep oodles of command history (see https://fburl.com/zshhistory).
HISTSIZE=1000000
SAVEHIST=1000000
setopt APPEND_HISTORY

# Allow tab completion in the middle of a word.
setopt COMPLETE_IN_WORD

 Enforce a safer 'sudo rm' for interactive sessions (https://fburl.com/workplace/pbo3xan0)
if [[ -o interactive ]]; then
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
# Set up personal aliases, functions, etc.
# ...(put your own stuff here!)...
#

export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=60
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export EDITOR='emacs -nw'

ZSH_THEME="custom"
COMPLETION_WAITING_DOTS="true"
plugins=(git python pip)

source $ZSH/oh-my-zsh.sh

## Aliases
alias emacs='emacs -nw'

alias .2='cd ../..'
alias .3='cd ../../..'

alias L='| less'
alias TL='| tail -20'
alias NIL="> /dev/null 2>&1"

alias l='ls -CF'
alias ll='ls -Al'
alias la='ls -A'

## Solarized dircolors (requires GNU coreutils)
eval `gdircolors $HOME/.dircolors`

## Use dircolors in tab completion
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

## Fuzzy complete
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
. /home/junhao/local/fbsource/whatsapp/server/erl/tools/waserver_bashrc
