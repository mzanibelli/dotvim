function! scratch#new(ft)
    silent enew
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
    setlocal modifiable
    let &filetype = a:ft
endfunction
