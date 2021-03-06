" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" ---------------------------------------------------------------------------- "
" plugins                                                                      "
" ---------------------------------------------------------------------------- "

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" ---------------------------------------------------------------------------- "
" general settings                                                             "
" ---------------------------------------------------------------------------- "

set nocompatible

colorscheme gruvbox

if !exists("g:syntax_on")
  syntax enable
endif

set autoread
set background=dark
set binary
set colorcolumn=80,120
set encoding=utf-8
set laststatus=2
set number
set title
set t_Co=256

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" indentation
set smarttab
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" wrapping
set nowrap
set linebreak

" history
set history=1000

" ---------------------------------------------------------------------------- "
" user interface                                                               "
" ---------------------------------------------------------------------------- "
if has("gui_running")
  set antialias
endif

" enable transparent background color
hi Normal ctermbg=None

" ---------------------------------------------------------------------------- "
" plugin configuration                                                         "
" ---------------------------------------------------------------------------- "

" vim-table-mode
let g:table_mode_corner = "|"
