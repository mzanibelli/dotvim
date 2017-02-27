function! source#root(type)
    let l:oldcwd = getcwd()
    let l:path = "."
    let l:folder = ".".a:type
    while !isdirectory(l:folder)
        if l:path ==# "/"
            execute "cd ".fnameescape(l:oldcwd)
            echom "Root not found"
            return
        endif
        execute "cd ".fnameescape(l:path)."/.."
        let l:path = getcwd()
        let l:folder = l:path."/.".a:type
    endwhile
    execute "call ".a:type."#mappings()"
    if filereadable("./cscope.out")
        set nocsverb
        cs add cscope.out
        set csverb
    endif
    if filereadable("./vimrc.local")
        source ./vimrc.local
    endif
    echom "Moved to ".getcwd()
endfunction

function! source#move(way)
    if &diff
        let l:cmd = a:way > 0 ? "]c" : "[c"
        execute "normal! ".l:cmd
    else
        let l:cmd = a:way > 0 ? "next" : "prev"
        let l:prefix = empty(getloclist(winnr())) ? "c" : "l"
        try
            execute l:prefix."open"
            execute l:prefix.l:cmd
            normal! zzzv
        catch
            execute l:prefix."close"
            echom "No errors"
        endtry
    endif
endfunction

function! source#functions()
     call search#ilist2qf('/\v\C<function>/')
endfunction
