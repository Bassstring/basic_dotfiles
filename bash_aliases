#!/usr/bin/env bash

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias vi='vim'
alias reload="source ~/.bash_profile"

# Lists the top 4 processes by CPU usage
alias hogs="ps -acrx -o pid,%cpu,command | awk 'NR<=5'"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias ll='ls -la'
  alias la='ls -a'
  alias l.='ls -d .*'
  alias lsd='ls -l | grep "^d"'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias venv='source ./venv/bin/activate'

## Vim related shortcuts
alias vimrc="vim ~/.vimrc"
alias vi='vim'
alias vimup="vim +PlugUpdate +qall && vim +PlugUpgrade +qall"

## git alias
alias gis='git status'
alias gip='git pull'
alias gsh='git push'
alias gic='git checkout'
alias gid='git diff'
alias gil='git lg'
alias gcm="git commit -m "$1""
alias gaa="git add -A ."
alias gib="git branch"
alias gta="git tag"
alias gr='cd "$(git rev-parse --show-toplevel)"'
alias gg='git grep'

