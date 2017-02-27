nnoremap gV `[V`]
vnoremap <silent> D :<C-U>call visual#duplicate()<CR>
vnoremap <silent> <C-N> :<C-U>call visual#down()<CR>
vnoremap <silent> <C-P> :<C-U>call visual#up()<CR>
vnoremap <silent> <Leader>a :<C-U>silent call visual#align()<CR>
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv
inoremap <silent> <C-Y> <C-R><C-R>=visual#copy('up')<CR>
inoremap <silent> <C-E> <C-R><C-R>=visual#copy('down')<CR>
