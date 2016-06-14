#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Bootstrapping $(whoami)'s computer"

# Source utility functions
. scripts/util.sh

# VIMRC CONFIG
link_file "$DIR/vim/vimrc" "$HOME/.vimrc"
