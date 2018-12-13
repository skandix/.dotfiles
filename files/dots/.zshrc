# Path to your oh-my-zsh installation.
export ZSH=/home/skandix/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Trilambda"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/skandix/.go/bin:/home/skandix/.gvm/bin:/usr/local/bin:/usr/bin:/bin:/home/skandix/.go/bin:/home/skandix/.gvm/bin:/usr/local/bin:/usr/bin:/bin"

source $ZSH/oh-my-zsh.sh

#NoBlanking
xset s off
xset -dpms
xset s noblank

#dirs 
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

#neofetch 
if [ -f /usr/bin/neofetch ]; then neofetch -t; fi

#golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/Projects/Go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# other
alias uuid="cat /proc/sys/kernel/random/uuid"
alias outside="while true; do clear; curl wttr.in/$1; sleep 180; done;"

# terminal
if [[ $TERM == xterm ]]; then
	    TERM=xterm-256color
fi