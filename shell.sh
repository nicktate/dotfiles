#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if ! type "zsh" > /dev/null; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mkdir -p "$HOME/.zsh"

ln -sfn $DIR/pure $HOME/.zsh/pure
ln -sfn $DIR/zshrc $HOME/.zshrc
