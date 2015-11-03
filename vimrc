" Vundle requirements
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'yorokobi/vim-splunk'
Plugin 'PProvost/vim-ps1'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


if has('gui_running')
    set background=light
else
    set background=dark
endif


" Looks
set laststatus=2
set showtabline=2
set guioptions=-e
colorscheme solarized
syntax on
set modeline

" Behaviour
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Search
set hlsearch
set ignorecase
set incsearch

" Mouse
set mouse=a


let g:vim_markdown_folding_disabled=1
let g:ps1_nofold_blocks=1
