" Local sourcing.
if filereadable($HOME."/.vimrc.before")
  source $HOME/.vimrc.before
endif

" Vundle requirements
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'tpope/vim-fugitive'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'yorokobi/vim-splunk'
Plugin 'PProvost/vim-ps1'
Plugin 'digitaltoad/vim-jade'
Plugin 'tfnico/vim-gradle'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'phleet/vim-mercenary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let g:fb_default_opts = 0
source $LOCAL_ADMIN_SCRIPTS/master.vimrc

let mapleader=","
let maplocalleader="\\"

if has('gui_running')
    set background=light
else
    set background=dark
endif

"----------------
" Status Line
"----------------
" status line symbols from ':help statusline'
" %{N}* - User{N} colors setting, where N is 1..9
" %< - collapse to left if window is too small
" %F - full file path
" %m - modified flag [+] (modified), [-] (unmodifiable)
" %r - readonly flag [RO]
" %h - help buffer g
" %w - preview window
" %b - value of byte under cursor
" %B - as above, in hexadecimal
" %l - line number
" %c - column number
" %V - virtual column number as -{num}
" %p - percentage through file in lines
" %= - separation point between left and right aligned items
" %Y - type of file in the buffer
" %L - number of lines in buffer
"" set statusline=%f%m%r%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%c%V]\ [%p%%]\ %=\ [FMT=%{&ff}]\ [ENC=%{&encoding}]\ [TYPE=%Y]\ [LEN=%L]

" Looks
set laststatus=2
set showtabline=1
set guioptions=-e
"let g:solarized_termtrans = 1
colorscheme dark-ruby
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
set nolist              " don't show invisible characters by default
set listchars=tab:>-
set pastetoggle=<F2>    " when in insert mode, press <F2> to go to paste mode
                        " where mass data won't be auto indented
set showmatch           " show matching paren when in insert mode
set backspace=indent,eol,start  " Delete beyond the start of the insert point
set number

" Better completion of the : prompt
set wildmenu
set wildmode=longest:list,full
set wildignore+=*.o,*.pyc,*.aux,*.cmi,*.cmo,*.cmx

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Highlight trailing whitespace.
hi ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * hi ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/


" Search
set hlsearch            " highlight search terms
set ignorecase          " ignore case in search
set incsearch           " show search as you type

" Mouse
set mouse=a             " enable mouse if term emulator allows it

" General
nnoremap Y y$

""""""""""""""""""""""""""""""""""""""""""
" Buffers and windows
""""""""""""""""""""""""""""""""""""""""""

" Settings.
set hidden            " keep hidden buffers around
set autoread          " automatically re-read modified files
set splitright        " hsplit to the right
set splitbelow        " vsplit to the left
set laststatus=2      " always show a status line

" For tabs :)
noremap <C-t>h :tabprevious<cr>
noremap <C-t>H :tabrewind<cr>
noremap <C-t>l :tabnext<cr>
noremap <C-t>L :tablast<cr>

"split navigations
let g:tmux_navigator_no_mappings=1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Speed up scrolling the viewporet
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" toggle line number
nnoremap <leader>n :set number!<cr>

" C-u will uppercase a word
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

""""""""""""""""""""""""""""""""""""""""""
" Tags
""""""""""""""""""""""""""""""""""""""""""

" Search up the directory tree for tags.
set tags=tags;/

" Use cscope along with ctags if it's available.
if has("cscope")
  " Defer to ctags.
  set cscopetagorder=1

  " Use :cstag instead of :tag and friends (<C-]>, etc.).
  set cscopetag

  " Add cscope databases in `pwd` or in $CSCOPE_DB.
  set nocscopeverbose
  if filereadable("cscope.out")
    cs add cscope.out
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set cscopeverbose
else
  " Use :tjump behavior for :tag and friends even without cscope.
  call Cabbrev('tag', 'tjump')
  nnoremap <C-]> g<C-]>
  vnoremap <C-]> g<C-]>
  nnoremap <C-W>] <C-W>g<C-]>
endif

""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""

" Airline - User powerline glyphs
let g:airline_powerline_fonts = 1

" NERDTree - Toggle buffer.
nnoremap <leader><Space> :NERDTreeToggle<CR><C-w>=

" NERDTree - Quit vim when all other windows have been closed.
au BufEnter *
  \ if (winnr("$") == 1 && exists("b:NERDTreeType") &&
  \ b:NERDTreeType == "primary") |
  \   q |
  \ endif

" Mercenary - Leader mappings.
nnoremap <leader>hb :HGblame<CR>
nnoremap <leader>hd :HGdiff<CR>

""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""

" Set language defaults.
let g:tex_flavor='latex'
let g:sql_type_default='mysql'

" Kill any trailing whitespace on save.
fu! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfu
au FileType c,cabal,cpp,haskell,javascript,ocaml,php,python,ruby,readme,tex,text
  \ au BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""
" Epilogue
""""""""""""""""""""""""""""""""""""""""""

" Local sourcing.
if filereadable($HOME."/.vimrc.after")
  source $HOME/.vimrc.after
endif
