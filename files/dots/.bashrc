[[ $- == *i* ]] || return


# Misc
export EDITOR=nvim

# Dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'
alias uiavpn='sudo openconnect vpn.uia.no --user bendid13@uia.no'
alias grandma2='cd "/home/skandix/.wine/drive_c/Program Files/MA Lighting Technologies"'

## Games
alias updateAddon="wine /home/skandix/Games/world-of-warcraft/drive_c/users/skandix/Application Data/Twitch/Bin/Twitch.exe"

# Auto complete
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# pfetch or motd
if [ -f /usr/bin/pfetch ];  then pfetch -t;  else cat /etc/motd; fi;

# Prompt
 export PS1="\[$(tput bold)\]\[\033[38;5;162m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;165m\]\h $(tput sgr0)\]\[\033[38;5;28m\]λ \[\e[0m\]"
#export PS1="\u@\h λ "


# calculator
calc() {
    echo $(python -c 'print($1)')
}
