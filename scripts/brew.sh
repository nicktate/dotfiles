#!/bin/bash

echo "Initializing Brew..."

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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
brew tap homebrew/versions
brew install bash-completion2

# Install latest version of zsh
brew install zsh

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash;
fi;

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Misc tools
brew install wget
brew install git
brew install git-lfs

# Remove outdated versions from the cellar.
brew cleanup
