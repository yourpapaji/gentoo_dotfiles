call plug#begin('~/.config/nvim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'davidhalter/jedi-vim'
" quote and bracket completion
Plug 'jiangmiao/auto-pairs'
" Track the engine.
Plug 'SirVer/ultisnips'
" syntax check
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

" Formater
Plug 'sbdchd/neoformat'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/defx.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'lilydjwg/colorizer'
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()
