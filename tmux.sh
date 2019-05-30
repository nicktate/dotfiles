#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -snf "$DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
