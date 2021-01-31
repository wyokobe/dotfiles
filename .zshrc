#-------------------------------------------------------
#   共通設定
#-------------------------------------------------------
# キー入力
alias df='df -h'                                                       # ディスク空き領域(単位表示)
alias less='less -r'                                                   # テキストファイルを日本語化して表示
alias rm='rm -i'                                                       # 削除前に確認
alias ssh='ssh -A'                                                     # SSH認証時にエージェントフォワード
alias vbb="vim ~/.zshenv ~/.zprofile ~/.zshrc"  # 編集
alias sbb="source ~/.zshenv ~/.zprofile ~/.zshrc"  # 反映
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
function gop() {
  ssh_url=$(git remote get-url origin)
  user=${ssh_url%@*}
  echo ${user}
  host_path=${ssh_url#*@}
  echo ${host_path}
  host=${host_path%:*}
  echo ${host}
  p=${host_path#*:}
  echo ${p}
  p=${p%.git}
  echo ${p}
  open "https://${host}/${p}"
}
## anyenv
[ -f ~/.anyenv/bin/anyenv ] && eval "$(anyenv init - zsh)"
## 計測完了
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
