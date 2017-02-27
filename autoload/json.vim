function! json#minify()
    call windows#preserve('%s/\s\+$//e')
    call windows#preserve('%left')
    normal! ggVGJ
endfunction
