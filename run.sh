#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export SCRIPT_DIR=$DIR/scripts
export DOTFILES_DIR=$DIR/dotfiles
export CONFIG_DIR=$DIR/config

echo "Bootstrapping your OS with Tate's dotfile configuration..."

$SCRIPT_DIR/setup_osx.sh
$SCRIPT_DIR/backup.sh
$SCRIPT_DIR/link.sh
$SCRIPT_DIR/brew.sh
