#!/usr/bin/env bash

GITIGNORE=$HOME/.dotfiles/.gitignore
TMUX_FOLDER=$HOME/.dotfiles/files/dots/.tmux/plugins/

for plugin_tmux in $(ls $TMUX_FOLDER | cut -d ' ' -f1 | grep -v tpm); do
    echo $plugin_tmux >> $GITIGNORE ;
done;
