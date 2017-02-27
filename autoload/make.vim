function! make#make()
    update
    call qf#lload("lmake")
    silent! ll1
endfunction
