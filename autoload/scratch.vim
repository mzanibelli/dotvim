function! scratch#new(...)
    let l:arg = a:0 == 1 ? a:1 : "none"
    silent enew
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
    setlocal modifiable
    let &filetype = l:arg
endfunction
