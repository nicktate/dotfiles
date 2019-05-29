#!/bin/bash

git clone --single-branch --branch overlay/nick --recursive https://github.com/nicktate/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
