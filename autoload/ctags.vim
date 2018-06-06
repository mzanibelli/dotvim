function! ctags#generate(ft)
    execute printf("!%s", ctags#dir()."/".a:ft)
endfunction

function! ctags#dir()
    return default#extra()."/ctags"
endfunction

function! ctags#complete(a, l, p)
    return default#dirmatches(ctags#dir(), a:a)
endfunction
