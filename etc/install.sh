#!/bin/bash

# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
  DOTPATH="$HOME/.dotfiles"; export DOTPATH
fi

DOTFILES_GITHUB="git@github.com:wyokobe/dotfiles.git"; export DOTFILES_GITHUB

xcode-select --install

[ -d "$DOTPATH" ] || git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"

cd "$DOTPATH"

git pull

make deploy
