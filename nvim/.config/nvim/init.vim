"True Color support
set t_Co=16
set nocompatible
filetype off
syntax on
set encoding=utf8
set clipboard=unnamed
set clipboard^=unnamed,unnamedplus
set shell=/bin/dash
set mouse=a
set undofile
set undodir=~/.cache/nvim/undo
set sb
set spr

" Set leader before loading all plugins
let mapleader = ";"

" Show linenumbers
set number
set ruler
set relativenumber
set wildmode=longest,list,full

set nobackup
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
set backspace=2
set backspace=indent,eol,start
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

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completions
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'sheerun/vim-polyglot'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Other
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'

" Git Support
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'Yggdroot/indentLine'
Plug 'shougo/neocomplete.vim'
Plug 'sbdchd/neoformat' " :NeoFormat
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': { -> mkdp#util#install() } }

" Initialize plugin system
call plug#end()

" Always display the status line
" set laststatus=2

" Enable highlighting of the current line
set cursorline

" Powerline
let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

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

" Lightline
set noshowmode
let g:lightline = {
			\   'colorscheme': 'gruvbox',
			\   'active': {
			\     'left':[ [ 'mode', 'paste' ],
			\              [ 'readonly', 'filename', 'modified' ]
			\     ]
			\   },
			\   'component': {
			\     'lineinfo': ' %3l:%-2v',
			\   },
			\   'component_function': {
			\     'gitbranch': 'fugitive#head',
			\   }
			\ }
let g:lightline.component_expand = {
			\  'linter_checking': 'lightline#ale#checking',
			\  'linter_warnings': 'lightline#ale#warnings',
			\  'linter_errors': 'lightline#ale#errors',
			\  'linter_ok': 'lightline#ale#ok',
			\ }
let g:lightline.component_type = {
			\     'linter_checking': 'left',
			\     'linter_warnings': 'warning',
			\     'linter_errors': 'error',
			\     'linter_ok': 'left',
			\ }
let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "
let g:lightline.tabline = {
			\   'left': [ ['tabs'] ],
			\   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'gitbranch', 'coc_status' ] ]
			\ }
set guioptions-=e  " Don't use GUI tabline

" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

" CoC
" if hidden is not set, TextEdit might fail.
set hidden
let g:coc_global_extensions = [
			\'coc-html',
			\'coc-python',
			\'coc-phpls',
			\'coc-emmet',
			\'coc-css'
			\]

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" NeoFormat
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" NERDTree git plugin
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

"NERDTree Syntax Highlighting Extension
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

"Markdown
nmap <C-p> <Plug>MarkdownPreviewToggle

"Window Navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <C-H> :vertical resize -5<CR>
nnoremap <C-J> :resize +5<CR>
nnoremap <C-K> :resize -5<CR>
nnoremap <C-L> :vertical resize +5<CR>
autocmd VimResized * wincmd =

"Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>
