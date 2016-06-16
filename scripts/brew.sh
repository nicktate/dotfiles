#!/bin/bash

echo "Initializing Brew..."

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Tap version, dupes, and cask keg
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap caskroom/fonts

# Update any existing formulas
brew update
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils
ln -sf /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Update bash to 4.x & completion to 2.x
brew install bash
brew install bash-completion2

# Install latest version of zsh
brew install zsh

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Misc tools
brew install gpg
brew install awscli
brew install git
brew install git-lfs
brew install htop
brew install wget
brew install tmux
brew install nvm

# Install fonts
brew cask install font-inconsolata

# Remove outdated versions from the cellar.
brew cleanup
