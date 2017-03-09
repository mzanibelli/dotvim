function! qf#cclear()
    cexpr []
    cclose
    echom "Quickfix list cleared"
endfunction

function! qf#cfirst()
    if len(getqflist()) == 1
        cc! 1
        silent call qf#cclear()
    endif
endfunction

function! qf#cload(command)
    silent call qf#cclear()
    silent execute a:command
    call setqflist(filter(copy(getqflist()), "v:val.valid == 1"))
    botright cwindow
    call qf#cfirst()
    redraw!
endfunction

function! qf#lclear()
    lexpr []
    lclose
    echom "Location list cleared"
endfunction

function! qf#lfirst()
    if len(getloclist(winnr())) == 1
        ll! 1
        silent call qf#lclear()
    endif
endfunction

function! qf#lload(command)
    silent call qf#lclear()
    silent execute a:command
    call setloclist(winnr(), filter(copy(getloclist(winnr())), "v:val.valid == 1"))
    lwindow
    call qf#lfirst()
    redraw!
endfunction

function! qf#quick()
    execute "normal! \<CR>"
    wincmd p
    close
endfunction
