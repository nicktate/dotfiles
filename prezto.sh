#!/bin/bash

git submodule init
git submodule update --recursive

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/prezto/runcoms/*; do
    if ! echo $rcfile | grep "README.md"; then
        echo "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
    fi
done

ln -s $HOME/.dotfiles/prezto $HOME/.zprezto
