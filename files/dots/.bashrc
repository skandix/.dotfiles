[[ $- == *i* ]] || return

# Misc
#export LC_CTYPE=en_GB.UTF-8

# colors bash creds to lasseh
export EDITOR=nvim

# Dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'
alias vim='nvim '

## Games
alias updateAddon="wine /home/skandix/Games/world-of-warcraft/drive_c/users/skandix/Application Data/Twitch/Bin/Twitch.exe"

# Auto complete
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# pfetch
if [ -f /usr/bin/pfetch ]; then pfetch -t; fi

# Prompt
export PS1="\[$(tput bold)\]\[\033[38;5;162m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;165m\]\h $(tput sgr0)\]\[\033[38;5;28m\]λ \[\033[38;5;15m\]"

# calculator
alias calc="python3"
