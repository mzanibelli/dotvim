" Commands
command! -buffer -nargs=0 Format call format#format()
command! -nargs=0 Fix silent! call format#fix()

" Autocommands
augroup FORMAT
    autocmd!
    autocmd BufWritePre * if exists("b:autoformat") && b:autoformat == 1 | call windows#preserve('normal! gggqG') | endif
    autocmd FileType * setlocal formatoptions=crqj
    autocmd FileType * setlocal matchpairs-=<:>
augroup END
