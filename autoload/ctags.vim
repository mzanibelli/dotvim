function! ctags#generate(ft)
    let l:file = ctags#dir()."/".a:ft
    if file_readable(l:file)
        call async#start(l:file, v:false)
    else
        echom "Unknown file type"
    endif
endfunction

function! ctags#dir()
    return default#extra()."/ctags"
endfunction

function! ctags#complete(a, l, p)
    return default#dirmatches(ctags#dir(), a:a)
endfunction
