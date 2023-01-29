# load zinit plugin manager
source /usr/share/zinit/zinit.zsh # yay -S zinit-git
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

## Plugins ##
zinit light trapd00r/LS_COLORS
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

## ENVS ##
PAGER = "less";
BROWSER = "firefox";
EDITOR = "nvim";
SHELL = "zsh";

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
alias vim="nvim"
alias nf="cd $HOME/.dotfiles && nvim . && cd -"

## BINDKEY ###
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

if [ -f /usr/bin/pfetch ];  then pfetch -t | lolcat;  else yay -S pfetch lolcat; fi;

PS1="%n@%m λ " # shell prompt
