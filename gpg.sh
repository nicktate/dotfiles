#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# GPG
# implicitly create .gnupg directory with correct permissions
gpg --list-keys 

# cannot symlink because of gpg permissions
ln -snf $DIR/gpg/profile $HOME/.gpg-profile
ln -snf $DIR/gpg/gpg.conf $HOME/.gnupg/gpg.conf
ln -snf $DIR/gpg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
