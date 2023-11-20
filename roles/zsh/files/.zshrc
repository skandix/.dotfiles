# load zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

## Plugins ##
zinit light trapd00r/LS_COLORS
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

## COLORS ##
(cat ~/.cache/wal/sequences &) &>/dev/null
source ~/.cache/wal/colors-tty.sh &>/dev/null

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

## ALIAS ##
alias ..="cd .."
alias ip="ip -c"
alias k="kubecolor"
alias kd="k delete -f ."
alias ka="k apply -f ."
alias o="openstack"
alias tf="terraform"
alias ls="ls --color"
alias compose="docker compose"
alias nf="cd $HOME/.dotfiles && nvim . && cd -"
#alias docker="podman"

## BINDKEY ###
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## EXPORT ##
source gitclones/bofh/openstack/openstack.sh

pfetch -t |lolcat

PS1="%n@%m λ " # shell prompt
