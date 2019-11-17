#!/bin/bash

[ -d ~/.anyenv/envs/pyenv ] || git clone https://github.com/pyenv/pyenv.git ~/.anyenv/envs/pyenv
[ -d ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv ] || git clone https://github.com/yyuu/pyenv-virtualenv ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv
