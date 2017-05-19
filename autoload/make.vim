function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        call make#make()
    endif
endfunction

function! make#make()
    update
    call qf#lload("lmake")
    silent! ll1
endfunction
