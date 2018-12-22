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

" Helpの日本語化
NeoBundle 'vim-jp/vimdoc-ja'

" gitで管理しているファイル編集時に差分を表現する
NeoBundle 'airblade/vim-gitgutter'

" vim-tags
NeoBundle 'szw/vim-tags'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" シンタックスハイライト
syntax enable

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
" 現在の行を強調表示
" set cursorline
" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!
" カーソル列を強調表示しない
set nocursorcolumn
" 挿入モードの時のみ、カーソル列をハイライトする
autocmd InsertEnter,InsertLeave * set cursorcolumn!
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
"タブ入力を複数の空白入力に置き換える
set expandtab
"画面上でタブ文字が占める幅
set tabstop=2
"自動インデントでずれる幅
set shiftwidth=2
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
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
" カラースキーマ変更
colorscheme stereokai
" タブ機能を強化
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
" vimtags
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=.tags
set tags+=.Gemfile.lock.tags
nnoremap <C-]> g<C-]>
" 挿入モード中にC-jで次の行へ
inoremap <C-j> <Esc>$o
" qのみでquit
nnoremap q :<C-u>q<CR>
" クリップボードと連携
set clipboard=unnamed,autoselect
vnoremap <C-y> "+y
