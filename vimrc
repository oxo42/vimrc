" Vundle requirements
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
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

let mapleader=","
let maplocalleader="\\"

if has('gui_running')
    set background=light
else
    set background=dark
endif


" Looks
set laststatus=2
set showtabline=1
set guioptions=-e
let g:solarized_termtrans = 1
" colorscheme solarized
syntax on
set modeline

" Editting Behaviour {{{
set showmode            " always show what mode we're currently editing in
set autoindent          " always set autoindenting on
set copyindent          " copy the previous indentation on autoindenting
set tabstop=4           " a tab is four spaces
set softtabstop=4       " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4        " number of spaces to use for autoindenting
set shiftround          " round the indent to shiftwidth
set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab           " expand tabs by default
" set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist              " don't show invisible characters by default
set pastetoggle=<F2>    " when in insert mode, press <F2> to go to paste mode
                        " where mass data won't be auto indented
set showmatch           " show matching paren when in insert mode
set backspace=indent,eol,start  " Delete beyond the start of the insert point

" Search
set hlsearch            " highlight search terms
set ignorecase          " ignore case in search
set incsearch           " show search as you type

" Mouse
set mouse=a             " enable mouse if term emulator allows it
" }}}

" Keyboard shortcuts {{{
" General
nnoremap Y y$

" For tabs :)
noremap <C-t>h :tabprevious<cr>
noremap <C-t>H :tabrewind<cr>
noremap <C-t>l :tabnext<cr>
noremap <C-t>L :tablast<cr>

" Speed up scrolling the viewporet
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" toggle line number
nnoremap <leader>n :set number!<cr>

" C-u will uppercase a word
nnoremap <C-u> viwU
inoremap <C-u> <Esc>viwUea

" Grep in vim
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" }}}

" Vim behaviour {{{
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
" }}}

let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:ps1_nofold_blocks = 1
