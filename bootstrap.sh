#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
git submodule init && git submodule update --recursive

$DIR/shell.sh
$DIR/homebrew.sh
