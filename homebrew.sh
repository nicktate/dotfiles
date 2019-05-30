#!/bin/bash

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# install or upgrade brew formula
brew_ioo() {
    if brew list | grep "$1"; then
        brew upgrade $1
    else
        brew install $1
    fi
}

# install or upgrade brew cask formula
brew_cask_ioo() {
    if brew cask list | grep "$1"; then
        brew cask upgrade $1
    else
        brew cask install $1
    fi
}

# Various
brew_ioo git
brew_ioo htop
brew_ioo wget
brew_ioo tmux
brew_ioo zsh
brew_ioo zsh-completions
brew_ioo hstr
brew_ioo docker

# GPG
brew_ioo gnupg
brew_ioo pinentry-mac

# Install caskroom
brew tap caskroom/cask

brew_cask_ioo google-chrome
brew_cask_ioo iterm2
brew_cask_ioo slack
brew_cask_ioo spectacle
brew_cask_ioo spotify

# Remove outdated versions
brew cleanup
