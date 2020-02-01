#!/bin/bash

# Get the aliases and functions
[ -f ~/.bashrc ] && source ~/.bashrc
[ -f ~/.profile ] && source ~/.profile
# User specific environment and startup programs
#-------------------------------------------------------
#   共通設定
#-------------------------------------------------------
# PATHの初期化
[ ! "$INITPATH" ] && export INITPATH=$PATH
[ "$INITPATH" ] && export PATH=$INITPATH
export HISTSIZE=10000
export HISTTIMEFORMAT='%Y%m%d %T '
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"' # ターミナル(iterm)でウィンドウとタブのタイトルを動的に表示
export EDITOR=vim                                                                      # Linux編集エディタを設定
# bin
[ -d "$HOME"/bin ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME"/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"
# anyenv
[ -d "$HOME"/.anyenv/bin ] && export PATH="$HOME/.anyenv/bin:$PATH" && eval "$(anyenv init -)"
#[ -d "$HOME"/.anyenv/envs/pyenv/plugins/pyenv-virtualenv ] && eval "$(pyenv virtualenv-init -)"
[ -d "$HOME"/.rbenv/bin ] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"
[ -d "$HOME"/.pyenv/bin ] && export PATH="$HOME/.pyenv/bin:$PATH" && eval "$(pyenv init -)"
[ -d "$HOME"/.jenv/bin ] && export PATH="$HOME/.jenv/bin:$PATH" && eval "$(jenv init -)"
[ -d "$HOME"/.goenv/bin ] && export PATH="$HOME/.goenv/bin:$PATH" && eval "$(goenv init -)"
# direnv
[ "$(which direnv 2>/dev/null)" ] && eval "$(direnv hook bash)"
# node
[ -d "$HOME"/.nodebrew/current/bin ] && export PATH="$HOME/.nodebrew/current/bin:$PATH"
#-------------------------------------------------------
#   OS別設定
#-------------------------------------------------------
case "${OSTYPE}" in
darwin*)
  # MacPorts Installer addition on 2017-10-06_at_12:32:45: adding an appropriate PATH variable for use with MacPorts.
  [ -d /opt/local/bin ] && export PATH="/opt/local/bin:$PATH"
  [ -d /opt/local/sbin ] && export PATH="/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.
  # Export a path to nodebrew:
  [ -d "$HOME"/.nodebrew/current/bin ] && export PATH="$HOME/.nodebrew/current/bin:$PATH"
  ;;
linux*)
  # eclipse
  export SWT_GTK3=0                                               # ハングアップ防止の為、eclipse 起動時にGTK3 が無効となるように設定
  export GTK_IM_MODULE=ibus XMODIFIERS=@im=ibus QT_IM_MODULE=ibus # 日本語入力を有効化
  hash ibus-daemon && test -n "$DISPLAY" && ibus-daemon -drx      # X11
  ;;
esac
#-------------------------------------------------------
#   追加設定
#-------------------------------------------------------
