#!/bin/bash

[ -d ~/.vim/colors ] || mkdir -p ~/.vim/colors
[ -d ~/.vim/colors/iceberg ] || git clone https://github.com/cocopon/iceberg.vim.git ~/.vim/colors/iceberg
[ -f ~/.vim/colors/iceberg.vim ] || ln -sfnv ~/.vim/colors/iceberg/colors/iceberg.vim ~/.vim/colors/iceberg.vim
