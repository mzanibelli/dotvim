augroup FORMAT
    autocmd!
    autocmd BufWritePre * if exists("b:autoformat") && b:autoformat == 1 | call windows#preserve('normal! gggqG') | endif
augroup END
