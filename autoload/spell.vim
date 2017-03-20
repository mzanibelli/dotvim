function! spell#correct()
    call default#save('spell', 1, 'normal! [s1z=`]')
endfunction

function! spell#switch()
    if &spelllang ==# "fr"
        let &spelllang = "en"
    else
        let &spelllang = "fr"
    endif
    redrawstatus!
endfunction
