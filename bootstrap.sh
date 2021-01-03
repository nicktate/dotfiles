#!/bin/bash

set -eou pipefail

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --cask karabiner-elements
brew install --cask hammerspoon
brew install --cask rectangle
