[[ $- == *i* ]] || return

# Misc
#export EDITOR

# Dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'
alias ip='ip -c'
alias vim=vim_or_nvim
alias pressmd='reveal-md --theme solarized --highlight-theme solarized-dark '

# Auto complete
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# pfetch or motd
if [ -f /usr/bin/pfetch ];  then pfetch -t;  else echo ""; fi;

# Prompt
export PS1="\[$(tput bold)\]\[\033[38;5;162m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;165m\]\h $(tput sgr0)\]\[\033[38;5;28m\]λ \[\e[0m\]"
#export PS1="\u@\h λ "


vim_or_nvim() {
    if command -v nvim
    then
        nvim
    else
        vim
    fi
}

# calculator
calc() {
    echo $(python -c 'print($1)')
}
