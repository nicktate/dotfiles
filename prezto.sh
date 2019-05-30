#!/bin/bash

git submodule init
git submodule update --recursive
cd prezto && git submodule init && git submodule update --recursive && cd ..

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/prezto/runcoms/*; do
    if ! echo $rcfile | grep "README.md"; then
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
    fi
done

if [ ! -e $HOME/.zprezto ]; then
    ln -s $HOME/.dotfiles/prezto $HOME/.zprezto
fi
