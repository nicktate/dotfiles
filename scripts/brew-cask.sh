#!/bin/bash

if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask

brew cask install spotify
brew cask install dash
brew cask install iterm2
brew cask install google-chrome
brew cask install chrome-devtools
brew cask install keepingyouawake
brew cask install mysqlworkbench
brew cask install sequel-pro
brew cask install spectacle
brew cask install slack
