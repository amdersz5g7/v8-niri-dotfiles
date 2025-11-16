call plug#begin()

Plug 'skammer/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'elixir-editors/vim-elixir'

call plug#end()

syntax on
set mouse=a
set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set virtualedit=onemore
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set ruler
set undolevels=1000
set backspace=indent,eol,start
filetype plugin indent on
set nocompatible
set clipboard=unnamed

" copy to system clipboard in visual mode
vnoremap <C-c> "+y

" copy the current line to system clipboard in normal mode
nnoremap <C-c> "+yy

" paste from system clipboard in normal mode
nnoremap <C-v> "+p

" paste from system clipboard in insert mode
inoremap <C-v> <C-r>+

" this is a comment
" set cursorline
