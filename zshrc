### Junhao's zsh config

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

## Fuzzy complete
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
  