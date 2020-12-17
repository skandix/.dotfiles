[[ $- == *i* ]] || return

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
export PS1="\u@\h λ "

# Functions
vim_or_nvim() {
    if command -v nvim &> /dev/null
    then
        nvim
    else
        vim
    fi
}
source "$HOME/.cargo/env"
