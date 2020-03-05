# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
[ -n "$SSH_CONNECTION" ] && echo -e "\033]11;#$(( ( RANDOM % 900000 )  + 10 ))\a"
