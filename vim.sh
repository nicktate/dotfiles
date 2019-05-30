#!/bin/bash


[ ! -d $HOME/.vim_runtime  ] && git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime

sh $HOME/.vim_runtime/install_awesome_vimrc.sh
ln -snf $HOME/.dotfiles/vim/my_configs.vim $HOME/.vim_runtime/my_configs.vim
