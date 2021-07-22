alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias ..="cd .."
alias ls="ls --color"
alias ip="ip -c"
alias nf="set a (pwd);cd && cd .dotfiles && vim && cd $a"
alias pressmd="reveal-md --theme solarized --highlight-theme solarized-dark "

if status is-interactive
    # Commands to run in interactive sessions can go here
    cat ~/.cache/wal/sequences &
end
