" Local sourcing.
if filereadable($HOME."/.vimrc.before")
  source $HOME/.vimrc.before
endif

" Vundle {{{
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'phleet/vim-mercenary'

Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'PProvost/vim-ps1'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'mxw/vim-hg'
Plugin 'hhvm/vim-hack'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'hashivim/vim-vagrant'
Plugin 'elzr/vim-json'
Plugin 'luochen1990/rainbow'
Plugin 'vito-c/jq.vim'
Plugin 'dag/vim-fish'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
"  }}}


let mapleader=","
let maplocalleader="\\"

if has('gui_running')
    set background=light
else
    set background=dark
endif

" Looks
set laststatus=2
set showtabline=2
set guioptions=-e

augroup vimrc_autocmds
  autocmd BufEnter * highlight ColorColumn ctermbg=235
  autocmd BufEnter * let &colorcolumn=join(range(89,999),",")
augroup END

" ConEmu
if $ConEmuANSI == "ON"
    colorscheme default
else
    "colorscheme dark-ruby
    colorscheme wombat256
endif

syntax on
set modeline

" Editting Behaviour {{{
set noshowmode          " always show what mode we're currently editing in
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
set showmatch           " show matching paren when in insert mode
set backspace=indent,eol,start  " Delete beyond the start of the insert point
set number
set scrolloff=3
" }}}

" Better completion of the : prompt
set wildmenu
set wildmode=longest:list,full
set wildignore+=*.o,*.pyc,*.aux,*.cmi,*.cmo,*.cmx

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
nnoremap <leader>e :e!<CR>
nnoremap <leader>x :!chmod 755 %<CR>
nnoremap Y y$
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

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
noremap <C-t>h :tabprevious<CR>
noremap <C-t>H :tabrewind<CR>
noremap <C-t>l :tabnext<CR>
noremap <C-t>L :tablast<CR>

"split navigations
let g:tmux_navigator_no_mappings=1

nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

" Speed up scrolling the viewporet
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" toggle line number
nnoremap <leader>n :set number!<CR>

" Grep in vim
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<CR>:copen<cr>
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
set foldlevel=99
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

" SimpylFold
let g:SimpylFold_docstring_preview = 1


" Airline - User powerline glyphs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" NERDTree - Toggle buffer.
"nnoremap <leader><Space> :NERDTreeToggle<CR><C-w>=
"nnoremap <leader>r :NERDTreeFind<CR>

" NERDTree - Quit vim when all other windows have been closed.
" au BufEnter *
"   \ if (winnr("$") == 1 && exists("b:NERDTreeType") &&
"   \ b:NERDTreeType == "primary") |
"   \   q |
"   \ endif

" Mercenary - Leader mappings.
nnoremap <leader>hb :HGblame<CR>
nnoremap <leader>hd :HGdiff<CR>

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" indentline
let g:indentLine_color_term = 239
if has("win32")
    let g:indentLine_char = '|'
else
    let g:indentLine_char = '┆'
endif

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" BufExplorer
nnoremap <leader>b :BufExplorerVerticalSplit<CR>

" FuzzyFinder
nnoremap <silent> <unique> <SPACE>o :FufBuffer<CR>
nnoremap <silent> <unique> <SPACE>f :FufFile<CR>
nnoremap <silent> <unique> <SPACE>d :FufDir<CR>
nnoremap <silent> <unique> <SPACE>cl :FufChangeList<CR>
nnoremap <silent> <unique> <SPACE>b :FufBookmarkDir<CR>
nnoremap <silent> <unique> <SPACE>a :FufBookmarkDirAdd<CR>
nnoremap <silent> <unique> <SPACE>t :FufTag<CR>
nnoremap <silent> <unique> <SPACE><TAB> :FufCoverageFile<CR>
nnoremap <silent> <unique> <SPACE>e :FufMruFile<CR>
nnoremap <silent> <unique> <SPACE>c :FufMruCmd<CR>


" vim json plugin
let g:vim_json_syntax_conceal = 0

let g:rainbow_active = 1


""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""

" Make tabs show up in red
syn match tab display "\t"
hi link tab Error

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
au FileType c,cabal,cpp,haskell,javascript,ocaml,php,python,ruby,readme,tex,text,vim
  \ au BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()

nnoremap <leader>w :%s/\s\+$//e<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""
" Epilogue
""""""""""""""""""""""""""""""""""""""""""

" Local sourcing.
if filereadable($HOME."/.vimrc.after")
  source $HOME/.vimrc.after
endif
