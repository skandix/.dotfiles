[[ $- == *i* ]] || return

# colors bash creds to lasseh
export EDITOR=vim

# Dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`

# Dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

# Golang
export GOPATH=$HOME/Projects/Go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Alias
alias uuid="cat /proc/sys/kernel/random/uuid"
alias outside="while true; do clear; curl wttr.in/$1; sleep 180; done;"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'

# Neofetch
if [ -f /usr/bin/neofetch ]; then neofetch -t; fi

export PS1="\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\] \[\e[35m\]\u\[\e[m\] \[\e[31m\]λ\[\e[m\] "

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
