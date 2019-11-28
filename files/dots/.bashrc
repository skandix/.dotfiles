[[ $- == *i* ]] || return

# colors bash creds to lasseh
export EDITOR=nvim

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
alias lol="lolcat -v 1.0 -h 1.0"
# games
alias updateAddon="wine /home/skandix/Games/world-of-warcraft/drive_c/users/skandix/Application Data/Twitch/Bin/Twitch.exe"
# Neofetch
if [ -f /usr/bin/neofetch ]; then neofetch -t; fi

export PS1="\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\W\[\e[m\] \[\e[35m\]\u\[\e[m\] \[\e[31m\]λ\[\e[m\] "
export LC_CTYPE=en_GB.UTF-8
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
if [ -f ~/.bashhub/bashhub.sh ]; then
  source ~/.bashhub/bashhub.sh
fi

