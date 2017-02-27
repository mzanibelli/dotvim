nnoremap <Leader>* :<C-U>noh<CR>/<C-R>/\<BAR>
nnoremap <Leader>/ :ilist //<Left>
nnoremap <expr> <Leader>: search#replace(0)
vnoremap <expr> <Leader>: search#replace(1)
nmap c* *cgn
nmap c# #cgn
nnoremap <silent> <Leader><Leader> :<C-U>noh<CR><Esc>
nnoremap / :<C-U>noh<CR>/
nnoremap ? :<C-U>noh<CR>?
nnoremap <silent> * :<C-U>let view = winsaveview()<CR>*:call winrestview(view)<CR>
nnoremap <silent> # :<C-U>let view = winsaveview()<CR>#:call winrestview(view)<CR>
nnoremap n nzvzz
nnoremap N Nzvzz
vnoremap <silent> * :<C-U>call search#selection()<CR>//<CR><C-O>:set hlsearch<CR>
vnoremap <silent> # :<C-U>call search#selection()<CR>??<CR><C-O>:set hlsearch<CR>
