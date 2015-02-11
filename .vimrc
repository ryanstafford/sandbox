if !isdirectory(expand("~/.vim/bundle/vundle"))
    call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim")
endif

filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nginx.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
call vundle#end()

" Auto install vundle plugins on first run
if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

filetype plugin indent on   " detect file type and load indents and plugins
syntax on                   " turn on syntax highlighting
colorscheme jellybeans      " syntax highlighting colours
set laststatus=2
let g:jellybeans_use_lowcolor_black = 0
let g:airline_powerline_fonts = 1
set nu!
set cursorline
set ts=2 sw=2 et
set autoindent
set smartindent
set smarttab
set softtabstop=4
set backspace=indent,eol,start 
set showmatch
set nobackup
set nowritebackup
set noswapfile
set showcmd
set hidden
set autochdir
set scrolloff=8
set history=1000
set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set foldmethod=manual
set pastetoggle=<F2>
set encoding=utf-8
set nocursorline

let mapleader = ","
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>c :Gcommit<cr>
nnoremap <leader>w :Gwrite<cr>
nnoremap <leader>u :Gread<cr>
nnoremap <leader>s :Gstatus<cr>
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|lib|git'

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

if has("gui_running")
  set guifont=DejaVu_Sans_Mono_for_Powerline:h10 
  set guioptions-=L  "remove scrollbar
  set guioptions-=T  "remove tool bar
  set guioptions-=m  "remove menu bar
endif

