function! diff#toggle()
    cclose
    lclose
    let l:count = len(getwininfo())
    if l:count == 1
        call diff#diffdisk()
    elseif l:count == 2
        call diff#diffwin()
    else
        echom "Invalid number of windows"
    endif
endfunction

function! diff#diffdisk()
    if &diff
        diffoff!
    else
        let l:source_ft = &ft
        vnew
        execute "0read #"
        setlocal nomodifiable nomodified readonly buftype=nofile bufhidden=wipe
        let &ft = l:source_ft
        call diff#diffwin()
    endif
endfunction

function! diff#diffwin()
    if &diff
        diffoff!
    else
        windo diffthis
        normal! gg
    endif
    wincmd t
endfunction
