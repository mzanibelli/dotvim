function! ctags#go(...)
    let l:tag = a:0 > 0 ? a:1 : expand("<cword>")
    try
        execute "ltag! ".l:tag
        lwindow
        lfirst!
        if len(getloclist(winnr())) == 1
            call qf#lclear()
        endif
    catch
        echo v:exception
    endtry
endfunction

function! ctags#generate(ft)
    let l:file = ctags#dir()."/".a:ft
    if file_readable(l:file)
        call async#start(l:file, "async#end")
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
