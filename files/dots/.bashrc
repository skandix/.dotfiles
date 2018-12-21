# colors bash creds to lasseh 
#PS1="\\[\\033[36m\\]\\u\\[\\033[m\\]@\\[\\033[32m\\]\\h:\\[\\033[33;1m\\]\\w\\[\\033[m\\]\$"
export EDITOR=vim
set -o vi 

#dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`
alias ls='ls --color'

#golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/Projects/Go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# other
alias uuid="cat /proc/sys/kernel/random/uuid"
alias outside="while true; do clear; curl wttr.in/$1; sleep 180; done;"

# sprunge.us
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us" 

# laziness
alias ..="cd .."

# show screenfetch on logon, delete /etc/motd, to make it look more clean.. :P
if [ -f /usr/bin/neofetch ]; then neofetch -t; fi

export PS1="\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\] \[\e[35m\]\u\[\e[m\] \[\e[31m\]λ\[\e[m\] "

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
if [ "$TERM" != "xterm-256color" ]; then
      export TERM=xterm-256color
    fi
