#!/bin/bash

set -eou pipefail

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

function biup_cask {
    if brew ls --cask --versions "$1" >/dev/null; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade --cask "$1"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask "$1"
    fi
}

brew update
biup_cask google-chrome
biup_cask karabiner-elements
biup_cask hammerspoon
biup_cask rectangle
biup_cask keepingyouawake
