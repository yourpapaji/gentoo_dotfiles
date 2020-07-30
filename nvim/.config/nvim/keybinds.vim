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
