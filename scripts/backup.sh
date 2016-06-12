#!/usr/bin/env bash

echo "BACKUP SCRIPT"

VIM_DIR=~/.vim
VIM_CONFIG=~/.vimrc

if [ -d $VIM_DIR ]; then
    mv $VIM_DIR $VIM_DIR.backup
fi

if [ -e $VIM_CONFIG ]; then
    mv $VIM_CONFIG $VIM_CONFIG.backup
fi

TMUX_CONFIG=~/.tmux.conf

if [ -e $TMUX_CONFIG ]; then
    mv $TMUX_CONFIG $TMUX_CONFIG.backup
fi
