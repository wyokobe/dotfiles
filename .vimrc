" 自動系
" 拡張子ごとに自動設定
"autocmd BufRead,BufNewFile *.sh   set filetype=bash
autocmd BufRead,BufNewFile *.php  set filetype=php
autocmd BufRead,BufNewFile *.rb   set filetype=ruby
autocmd BufRead,BufNewFile *.java set filetype=java
autocmd BufRead,BufNewFile *.py   set filetype=python
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 自動バックアップ機能を無効化
set nobackup
" スワップファイルを作らない
set noswapfile
" 内部文字コード
set encoding=utf-8
" ファイル書き込み時の文字コード
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
" 改行コードの自動認識
set fileformats=unix,dos,mac
" インデント
set cindent
set smartindent
set autoindent

" 操作系
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" バックスペースを設定
set backspace=start,eol,indent
" ウィンドウの幅より長い行は折り返さない
set nowrap
" 改行後にＢＳを押すと上の行末の1文字を消去する
set bs=2
" テキストの整形方法を決定
set formatoptions=qro
" 折りたたみ機能の設計
set foldmethod=marker foldmarker={{{,}}}
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" コマンドラインの補完
set wildmode=list:full
" コマンドラインモードの補完
set wildmenu

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 見た目系
"タイトルを表示
set title
" 行番号を表示
set number
" カーソルの位置表示を行う
set ruler
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set showmatch
" ビープ音を可視化
set visualbell

" Tab系
" タブ、空白、改行の可視化
set list listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
" Tab文字を半角スペースにする
set expandtab
" <TAB>を含むファイルを開いた際、<TAB>を何文字の空白に変換するかを設定。
set tabstop=2
" キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するかを設定。
set softtabstop=2
" vimが自動でインデントを行った際、設定する空白数。
set shiftwidth=2

" ステータスライン
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]

" ハイライトを有効化
syntax on
highlight Comment ctermfg=gray

" 全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" NeoBundle
if isdirectory('~/.vim/bundle')
    if has('vim_starting')
        " 初回起動時のみruntimepathにneobundleのパスを指定する
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    " NeoBundleを初期化
    call neobundle#begin(expand('~/.vim/bundle/'))
    " インストールするプラグインをここに記述
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/vimfiler'
    NeoBundle 'fatih/vim-go'
    call neobundle#end()
    " NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
    NeoBundleCheck
    " ファイルタイプ別のプラグイン/インデントを有効にする
    filetype plugin indent on
    " VimFilerプラグインを:VimFilerコマンドを叩いて起動させるまでは読み込みを行わない
    NeoBundleLazy 'Shougo/vimfiler', {
    \   'autoload' : { 'commands' : [ 'VimFiler' ] },
    \ }
endif

" js-beautify
if executable('js-beautify')
  command! -range=% -nargs=* HTMLTidy <line1>,<line2>call RangeHtmlBeautify()
  command! -range=% -nargs=* JSTidy <line1>,<line2>call RangeJsBeautify()
  command! -range=% -nargs=* CSSTidy <line1>,<line2>call RangeCSSBeautify()
  command! -range=% -nargs=* JSONTidy <line1>,<line2>call RangeJsonBeautify()
endif

" カラースキーマ
colorscheme iceberg
