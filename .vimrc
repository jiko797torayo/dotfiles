if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim createdirs
    \ https://raw.github.com/junegunn/vimplug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'jelera/vim-javascript-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
call plug#end()

packloadall                
silent! helptags ALL

" vim-gitgutterの設定
set signcolumn=yes
set updatetime=250
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'molokai'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_theme = 'molokai'


" Enable file type based indentation.
filetype plugin indent on

nnoremap <silent><C-n> :NERDTreeToggle<CR>

" Respect indentation when starting a new line.
set autoindent             

" Expand tabs to spaces. Essential in Python.
set expandtab              

" Number of spaces tab is counted for.
set tabstop=2              

" Number of spaces to use for autoindent.
set shiftwidth=2           

" Fix backspace behavior on most terminals.
set backspace=2            

" ハイライトをESC×2回で消す
nnoremap <silent> <Esc><Esc> :noh<CR>

" 挿入モードではハイライトを無効
autocmd InsertEnter * set nohlsearch

" 挿入モード以外ではハイライトを有効
autocmd InsertLeave * set hlsearch

" jjで挿入モード終了＆保存
inoremap <silent> jj <ESC>:w<CR>

" 挿入モードでカーソルを右に移動する
inoremap <C-l> <Right>
inoremap <C-k> <C-p>

nnoremap <C-g> :Rg<Space>

" qのみでquit
nnoremap q :<C-u>q<CR>

if !isdirectory(expand("$HOME/.vim/swap"))
  call mkdir(expand("$HOME/.vim/swap"), "p")
endif
set directory=$HOME/.vim/swap

set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir
set hlsearch
set incsearch
set clipboard=unnamed,unnamedplus

noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

command! Bd :bp | :sp | :bn | :bd

set laststatus=2
set showcmd

" 画面分割系
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l


set t_Co=256
syntax on
colorscheme molokai
