#!/bin/bash

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Various
brew install git
brew install htop
brew install wget
brew install tmux
brew install zsh
brew install zsh-completions

# GPG
brew install gnupg 
brew install pinentry-mac

# Install caskroom
brew tap caskroom/cask

brew cask install google-chrome
brew cask install iterm2
brew cask install slack
brew cask install spectacle
brew cask install spotify

# Remove outdated versions
brew cleanup
