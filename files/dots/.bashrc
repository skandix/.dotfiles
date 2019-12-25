[[ $- == *i* ]] || return

# Misc
export LC_CTYPE=en_GB.UTF-8

# colors bash creds to lasseh
export EDITOR=nvim

# Dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'

## Games
alias updateAddon="wine /home/skandix/Games/world-of-warcraft/drive_c/users/skandix/Application Data/Twitch/Bin/Twitch.exe"

# Auto complete
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Neofetch
if [ -f /usr/bin/neofetch ]; then neofetch -t; fi

# Prompt
export PS1="\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\W\[\e[m\] \[\e[35m\]\u\[\e[m\] \[\e[31m\]λ\[\e[m\] "
#export PS1="\[$(tput bold)\]\[\033[38;5;162m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] @ \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;165m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;28m\]>\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;28m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \W\[$(tput sgr0)\]"
