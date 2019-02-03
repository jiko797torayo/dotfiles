"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/koji/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/koji/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" カラースキームmolokai
NeoBundle 'tomasr/molokai'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

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

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" auto-ctagsを導入 :Ctags で実行
NeoBundle 'soramugi/auto-ctags.vim'

" 検索を強化
NeoBundle 'rking/ag.vim'

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

" 次のタブに切り替え
nnoremap sn gt
"
" 前のタブに切り替え
nnoremap sp gT

" タブを入れ替え
nnoremap sr <C-w>r

" 大きさを揃える
nnoremap s= <C-w>=
nnoremap sO <C-w>=

" 新規タブ
nnoremap st :<C-u>tabnew<CR>

" 別のウインドウへ
nnoremap sw <C-w>w

" 水平分割
nnoremap ss :<C-u>sp<CR>

" 垂直分割
nnoremap sv :<C-u>vs<CR>

" ウインドウを閉じる
nnoremap sq :<C-u>q<CR>

" 挿入モード中にC-jで次の行へ
inoremap <C-j> <Esc>$o

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
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif

" バッファコマンドの追加
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>

" 挿入モードでカーソルを右に移動する
imap <C-l> <Right>
