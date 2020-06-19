if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Personal scripts
if [ -d "$HOME/.dotfiles/scripts" ] ; then
    PATH="$HOME/.dotfiles/scripts:$PATH"
fi


