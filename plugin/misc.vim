vnoremap $ g_
noremap gj j
noremap gk k
noremap j gj
noremap k gk
nnoremap g; g;zvzz
nnoremap g, g,zvzz

augroup DEFAULT
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
    autocmd FileType * setlocal formatoptions=crqj
    autocmd FileType * setlocal matchpairs-=<:>
    autocmd InsertLeave * set nopaste
augroup END
