"True Color support
set t_Co=16
set encoding=UTF-8
set nocompatible
filetype off
syntax on
set encoding=utf8
set clipboard^=unnamed,unnamedplus
set shell=/bin/sh
set mouse=a
set undofile
set undodir=~/.cache/nvim/undo
"set sb
"set spr
"set visualbell

" make vim faster
set lazyredraw
set synmaxcol=180

" Set leader before loading all plugins
let mapleader = ";"

" Show linenumbers
"set number
"set ruler
set relativenumber
set wildmode=longest,list,full
" Enable highlighting of the current line
set cursorline

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set nobackup
set nowritebackup
set noswapfile
set autoread
set autowrite
set confirm
set splitbelow
set bsdir=buffer
set laststatus=2
set statusline=-        " hide file name in statusline
set fillchars+=vert:\|  " add a bar for vertical splits
set history=2000
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100
set list
set showtabline=2  " Show tabline
set smarttab
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set grepprg=rg\ --vimgrep\ $*
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
set hidden
set shortmess=aFc

" plugins
source $HOME/.config/nvim/plugconfigs/vimplug.vim

" Theme and Styling
set background=dark
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_hls_cursor='orange'
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=0
colorscheme gruvbox

" python
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" config sources
source $HOME/.config/nvim/plugconfigs/coc.vim
source $HOME/.config/nvim/plugconfigs/lightline.vim
source $HOME/.config/nvim/plugconfigs/nerdtree.vim
source $HOME/.config/nvim/keybinds.vim
