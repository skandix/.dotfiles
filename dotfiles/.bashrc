#!/usr/bin/env bash

# Dircolors
export LS_OPTIONS='--color=auto'
eval "$(dircolors $HOME/.dircolors)"

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'
alias ip='ip -c'
alias pressmd='reveal-md --theme solarized --highlight-theme solarized-dark '
alias tf='terraform'

# pywal
(cat ~/.cache/wal/sequences &)

# pfetch or motd
if [ -f /usr/bin/pfetch ];  then pfetch -t | lolcat;  else echo "need to install pfetch"; fi;

# Prompt
export PS1="\u@\h λ "

