function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        silent lmake
        redraw!
    endif
endfunction
