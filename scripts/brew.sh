#!/usr/bin/env bash

echo "BREW SCRIPT"

if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

brew install git
brew install git-lfs
brew install tmux

# Remove outdated versions from the cellar.
brew cleanup
