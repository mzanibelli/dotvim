function! spell#correct()
    let l:last_spell = &spell
    set spell
    normal! [s1z=`]
    let &spell = l:last_spell
endfunction

function! spell#switch()
    if &spelllang ==# "fr"
        let &spelllang = "en"
    else
        let &spelllang = "fr"
    endif
    redrawstatus!
endfunction
