# Dircolors
export LS_OPTIONS='--color=auto'
eval `dircolors $HOME/.dircolors`

# Alias
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls='ls --color'
alias ip='ip -c'
alias pressmd='reveal-md --theme solarized --highlight-theme solarized-dark '
alias nf='a=$(pwd);cd && cd .dotfiles && vim && cd $a'
alias tf='terraform'


# pywal
(cat ~/.cache/wal/sequences &)

# pfetch or motd
if [ -f /usr/bin/pfetch ];  then pfetch -t;  else echo "need to install pfetch"; fi;

# Prompt
if [ -z ${LOLCAT_SEED+x} ]; then LOLCAT_SEED=1; else let "LOLCAT_SEED += 1"; fi

export PS1="[\t] \u@\h λ "

