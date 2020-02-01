#!/bin/bash

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc
# User specific environment and startup programs
#-------------------------------------------------------
#   共通設定
#-------------------------------------------------------
# Color
P_GRAY="\[\033[0m\]"
P_BLACK="\[\033[30m\]"
P_RED="\[\033[31m\]"
P_YELLOW="\[\033[32m\]"
P_ORANGE="\[\033[33m\]"
P_BLUE="\[\033[34m\]"
P_PURPLE="\[\033[35m\]"
P_SKY="\[\033[36m\]"
P_WHITE="\[\033[37m\]"
# キー入力
#stty stop undef     # Ctrl+S(stop)を常に無効
alias df='df -h'                                                       # ディスク空き領域(単位表示)
alias less='less -r'                                                   # テキストファイルを日本語化して表示
alias rm='rm -i'                                                       # 削除前に確認
alias ssh='ssh -A'                                                     # SSH認証時にエージェントフォワード
alias vbb="vim ~/.bashrc ~/.bash_profile"                              # bashを編集
alias sbb="source ~/.bash_profile"                                     # bashを反映
alias cmd='(alias;declare -F) | less'                                  # コマンドリスト
alias jsb='js-beautify -U "" -s 2 -r'                                  # ファイル整形
function gg() { grep -nir "$1" ./; }                                   # 簡易grep
function ff() { find . -name "*$1*"; }                                 # pwd以下を検索
function ffgg() { find . -name "*$1*" -type f | xargs grep -ni "$2"; } # 検索
function gcom() {
  git add .
  echo -n "commit comment:"
  read line
  git commit -m "$line"
  git push
}
#-------------------------------------------------------
#   OS別設定
#-------------------------------------------------------
case "${OSTYPE}" in
darwin*)
  P_COLOR=${P_ORANGE}
  C_COLOR=${P_WHITE}
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  # 秘密鍵を確認し、ない場合は登録する
  ssh-add -l || ssh-add
  # sshのホスト名を補完する
  [ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
  ;;
linux*)
  P_COLOR=${P_SKY}
  C_COLOR=${P_WHITE}
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac
PS1="${P_COLOR}[\d \t \u@\h \W]\$${C_COLOR} "
#-------------------------------------------------------
#   追加設定
#-------------------------------------------------------
