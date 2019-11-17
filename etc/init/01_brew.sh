#!/bin/bash

hash brew 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
hash tree 2>/dev/null || brew install tree
hash wget 2>/dev/null || brew install wget
hash nodebrew 2>/dev/null || brew install nodebrew
[ -d ~/.nodebrew/src ] || mkdir -p ~/.nodebrew/src
[ "$(nodebrew list 2>/dev/null)" ] || nodebrew install-binary latest
hash node 2>/dev/null || nodebrew use $(echo $(nodebrew list) | cut -f 1 -d " ")
hash js-beautify 2>/dev/null || npm -g install js-beautify
