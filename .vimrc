"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/koji/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/koji/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" C-pでファイル検索
NeoBundle 'ctrlpvim/ctrlp.vim'

" カラースキームmolokai
NeoBundle 'tomasr/molokai'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'

" 静的解析
NeoBundle 'scrooloose/syntastic'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" 一括コメントアウト gc
NeoBundle 'tpope/vim-commentary'

" 括弧の自動入力
NeoBundle 'Townk/vim-autoclose'
autocmd FileType ruby setlocal commentstring=#\ %s

" ディレクトリツリー <C-n>
NeoBundle 'scrooloose/nerdtree'
nmap <silent><C-n> :NERDTreeToggle<CR>

" 括弧の差し替え、追加、削除
" cs"' / ys[text object]"
NeoBundle 'tpope/vim-surround'

" gitで管理しているファイル編集時に差分を表現する
NeoBundle 'airblade/vim-gitgutter'

" slimファイルハイライト
NeoBundle "slim-template/vim-slim"

" rubyファイルハイライト
NeoBundle     'vim-ruby/vim-ruby'

" 検索を強化
NeoBundle 'rking/ag.vim'

" コードを書いてすぐ結果を見る
NeoBundle 'thinca/vim-quickrun'
silent! nmap <Space>r <Plug>(quickrun)
let g:quickrun_config={'*': {'split': 'below'}}

" vim内でgit操作
NeoBundle 'tpope/vim-fugitive'

" React用ハイライト
NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'mxw/vim-jsx'
NeoBundle 'maxmellon/vim-jsx-pretty'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'peitalin/vim-jsx-typescript'
" javascriptとJSXの2つのファイルタイプを指定する
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx

" emmet
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-k>'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" jjで挿入モード終了＆保存
inoremap <silent> jj <ESC>:w<CR>

"文字コードをUFT-8に設定
set fenc=utf-8
set encoding=utf-8
set fileformats=unix,dos,mac

" 入力中のコマンドをステータスに表示する
set showcmd

" カーソル行を強調表示しない
autocmd InsertEnter,InsertLeave * set cursorline!

" カーソル列を強調表示しない
set nocursorcolumn

" 挿入モードの時のみ、カーソル列をハイライトする
autocmd InsertEnter,InsertLeave * set cursorcolumn!

"タブ入力を複数の空白入力に置き換える
set expandtab

"改行時に前の行のインデントを継続する
set autoindent

"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" ステータス行を常に表示
set laststatus=2

" メッセージ表示欄を2行確保
set cmdheight=2

" 対応する括弧を強調表示
set showmatch

" 検索文字列をハイライトする
set hlsearch

" インクリメンタルサーチを行う
set incsearch

" 大文字と小文字を区別しない
set ignorecase

" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan

" ハイライトをESC×2回で消す
nnoremap <silent> <Esc><Esc> :noh<CR>

" 挿入モードではハイライトを無効
autocmd InsertEnter * set nohlsearch

" 挿入モード以外ではハイライトを有効
autocmd InsertLeave * set hlsearch

" 保存時に行末スペースを削除
autocmd BufWritePre * :%s/\s\+$//ge

" 行番号を追加
set number

" アップデートタイムを高速化（git用）
set updatetime=250

" -------------------------------
" タブ機能を強化
" -------------------------------

" タブ間を移動
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" 分割したウインドウそのものを移動する
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" 大きさを揃える
nnoremap s= <C-w>=
nnoremap sO <C-w>=

" 新規タブ
nnoremap st :<C-u>tabnew<CR>

" 水平分割
nnoremap ss :<C-u>sp<CR>

" 垂直分割
nnoremap sv :<C-u>vs<CR>

" ウインドウを閉じる
nnoremap sq :<C-u>q<CR>

" qのみでquit
nnoremap q :<C-u>q<CR>

" クリップボードと連携
set clipboard=unnamed,autoselect
vnoremap <C-y> "+y

" スワップファイルを作成しない
set noswapfile

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

"----------------------------------------------------------
" molokaiの設定
"----------------------------------------------------------
colorscheme molokai
set t_Co=256
execute pathogen#infect()
syntax on

" ファイル形式の検出を有効化する
filetype on

" ファイル形式別インデントのロードを有効化する
filetype indent on

" ファイル形式別プラグインのロードを有効化する
filetype plugin indent on

" ctagsの設定
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-b> g<C-]>

" インデント幅の設定
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scala       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jsx         setlocal sw=2 sts=2 ts=2 et
endif

" バッファコマンドの追加
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>

" 挿入モードでカーソルを右に移動する
imap <C-l> <Right>

" space2回でカーソル下の単語をハイライトする
nnoremap <silent> <Space><Space> "zyiw:let @/ = @z<CR>:set hlsearch<CR>
" ＃を押すとカーソル下単語をハイライトしてから置換後文字列を入力する状態にする
nmap # <Space><Space>:%s/<C-r>///gc<Left><Left><Left>

" 改行コマンド
if !has('gui_running')
  " CUIで入力された<S-CR>,<C-S-CR>が拾えないので
  " iTerm2のキー設定を利用して特定の文字入力をmapする
  map ✠ <S-CR>
  imap ✠ <S-CR>
  map ✢ <C-S-CR>
  imap ✢ <C-S-CR>
endif
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>
nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z

" 自動囲みコマンド
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" タブ設定
set tabstop=2
set shiftwidth=2
set expandtab

" 閉じタグに飛ぶ
source /usr/local/share/vim/vim81/macros/matchit.vim
let b:match_words = '<:>,<div.*>:</div>'
