#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Git
ln -snf $DIR/git/gitignore $HOME/.gitignore

# Copy so it may be overridden
cp $DIR/git/gitconfig $HOME/.gitconfig
