if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim")
endif

filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

if has("win32")
  set guifont=DejaVu_Sans_Mono_for_Powerline:h10
  set rtp+=~/fzf-master
else
  "set guifont=Overpass\ Nerd\ Font:h15 
  set guifont=DejaVu_Sans_Mono_for_Powerline:h10
  set rtp+=/usr/local/opt/fzf
endif

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nginx.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'dense-analysis/ale'
Plugin 'posva/vim-vue'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'mxw/vim-jsx'
Plugin 'yuezk/vim-js'
Plugin 'MaxMEllon/vim-jsx-pretty'
"Plugin 'alampros/vim-styled-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim/killersheep'
Plugin 'cespare/vim-toml'

call vundle#end()

" Auto install vundle plugins on first run
if !isdirectory(expand("~/.vim/bundle/vim-airline"))
    execute 'silent BundleInstall'
    execute 'silent q'
endif

filetype plugin indent on   " detect file type and load indents and plugins
syntax on                   " turn on syntax highlighting
let g:jsx_ext_required = 0 
colorscheme jellybeans      " syntax highlighting colours
set splitbelow splitright
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237
let &t_Co=256
set laststatus=2
let g:jellybeans_use_lowcolor_black = 0
let g:airline_powerline_fonts = 1
set nu!
set mouse=v
set ttymouse=xterm2
set cursorline
set ts=2 sw=2 et
set autoindent
set smartindent
set smarttab
"set softtabstop=4
set backspace=indent,eol,start 
set showmatch
set nobackup
set nowritebackup
set noswapfile
set showcmd
set hidden
set autochdir
"set scrolloff=8
set history=1000
set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set foldmethod=syntax
au BufRead * normal zR
set pastetoggle=<F2>
set encoding=utf-8
set nocursorline
set guioptions= "remove all

let mapleader = ","
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>w :Gwrite<cr>
nnoremap <leader>m :Gcommit<cr>
nnoremap <leader>u :Gread<cr>
nnoremap <leader>s :Gstatus<cr>
nnoremap <leader>f :Gdiff<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>z za
vnoremap <leader>c "+y
map <leader>v "+P
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
"let g:ctrlp_custom_ignore = 'node_modules\|lib|git|dist'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_javascript_eslint_use_global = 1
let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcs_executable = 'phpcs --exclude=PSR1.Classes.ClassDeclaration.MissingNamespace'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
hi link ALEErrorSign    Error
hi link ALEWarningSign  Yellow
let g:ale_sign_error = '>>' " could use emoji
let g:ale_sign_warning = '--' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
autocmd BufWritePost * GitGutter

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
