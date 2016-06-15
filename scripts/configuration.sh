#!/bin/bash

# Ask all configuration questions up front
while true; do
    read -p "Would you like to use zsh or bash? (zsh / bash)" shell
    case $shell in
        [zsh]* ) export TDC_SHELL_CHOICE=zsh; break;;
        [bash]* ) export TDC_SHELL_CHOICE=bash; break;;
        * ) echo "Please enter zsh or bash.";;
    esac
done

while true; do
    read -p "Would you like to clear all dock icons? (y/n)" yn
    case $yn in
        [yY]* ) export TDC_CLEAR_DOCK_ICONS=true; break;;
        [nN]* ) export TDC_CLEAR_DOCK_ICONS=false; break;;
        * ) echo "Please enter y/n.";;
    esac
done

if [[ -z "$(git config --global user.email)" ]]; then
    read -p "What is your github email?" email
    git config --global user.email "$email"
fi

if [[ -z "$(git config --global user.name)" ]]; then
    read -p "What is your github user name?" name
    git config --global user.name "$name"
fi
