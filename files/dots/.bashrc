#dircolors
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

#NoBlanking
xset s off
xset -dpms
xset s noblank

# colors bash creds to lasseh
PS1="\\[\\033[36m\\]\\u\\[\\033[m\\]@\\[\\033[32m\\]\\h:\\[\\033[33;1m\\]\\w\\[\\033[m\\]\$"

# sprunge.us
# needs curl installed, can pipe output to a sprunge.us link
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us" 

# show screenfetch on logon, delete /etc/motd, to make it look more clean.. :P
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
