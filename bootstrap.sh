#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Bootstrapping $(whoami)'s computer"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Source utility functions
. scripts/util.sh

# Prompt user for all configuration options
scripts/configuration.sh

# Configure osx
scripts/osx_setup.sh

# Install brew
scripts/brew.sh

# Ensure that vundle submodule is up-to-date
git submodule init && git submodule update

# VIMRC CONFIG
link_file "$DIR/vim/vimrc" "$HOME/.vimrc"
link_file "$DIR/vim/vim" "$HOME/.vim"

# TMUX CONFIG
link_file "$DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

# BASH CONFIG
link_file "$DIR/bash/bash_profile" "$HOME/.bash_profile"

# ZSH CONFIG
link_file "$DIR/zsh/zshrc" "$HOME/.zshrc"

case $TDC_SHELL_CHOICE in
        [zsh]* ) sudo chsh -s $(which bash);;
        [bash]* ) sudo chsh -s $(which zsh);;
esac

# Install vundle
vim +PluginInstall +qall
