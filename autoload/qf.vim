function! qf#cclear()
    cexpr []
    cclose
    echom "Quickfix list cleared"
endfunction

function! qf#cfirst(...)
    if len(getqflist()) == 1
        cc! 1
        silent call qf#cclear()
    elseif a:0 > 0 && a:1 == 1 && &ft ==# "qf"
        nnoremap <buffer> <silent> <CR> <CR>:<C-U>silent call qf#cclear()<CR>
    endif
endfunction

function! qf#cload(command)
    silent call qf#cclear()
    silent execute a:command
    call setqflist(filter(copy(getqflist()), "v:val.valid == 1"))
    botright cwindow
    redraw!
endfunction

function! qf#lclear()
    lexpr []
    lclose
    echom "Location list cleared"
endfunction

function! qf#lfirst(...)
    if len(getloclist(winnr())) == 1
        ll! 1
        silent call qf#lclear()
    elseif a:0 > 0 && a:1 == 1 && &ft ==# "qf"
        nnoremap <buffer> <silent> <CR> <CR>:<C-U>silent call qf#lclear()<CR>
    endif
endfunction

function! qf#lload(command)
    silent call qf#lclear()
    silent execute a:command
    call setloclist(winnr(), filter(copy(getloclist(winnr())), "v:val.valid == 1"))
    lwindow
    redraw!
endfunction
