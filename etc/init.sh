#!/bin/bash

# Set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
  DOTPATH="$HOME/.dotfiles"
  export DOTPATH
fi

DOTFILES_GITHUB="git@github.com:wyokobe/dotfiles.git"
export DOTFILES_GITHUB

# shellcheck disable=SC2230
[ "$(which xcode-select 2>/dev/null)" ] || xcode-select --install

[ -d "$DOTPATH" ] || git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"

cd "$DOTPATH"

git pull

make init
