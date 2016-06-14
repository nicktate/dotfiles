#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Bootstrapping $(whoami)'s computer"

# Source utility functions
. scripts/util.sh

# Ensure that vundle submodule is up-to-date
git submodule init && git submodule update

# VIMRC CONFIG
link_file "$DIR/vim/vimrc" "$HOME/.vimrc"
link_file "$DIR/vim/vim" "$HOME/.vim"

# Install vundle
vim +PluginInstall +qall
