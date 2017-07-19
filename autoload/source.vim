let s:source_types = ["git","svn"]

function! source#root()
    let l:oldcwd = getcwd()
    let l:path = l:oldcwd
    let l:cmd = haslocaldir() ? "lcd" : "cd"
    while l:path !=# "/"
        for type in s:source_types
            let l:file = l:path."/.".type
            if filereadable(l:file) || isdirectory(l:file)
                echom "Moved to ".l:path
                return
            endif
        endfor
        execute l:cmd fnameescape(l:path)."/.."
        let l:path = getcwd()
    endwhile
    execute l:cmd fnameescape(l:oldcwd)
    echom "Project root not found"
endfunction

function! source#move(way)
    if &diff
        let l:cmd = a:way > 0 ? "]c" : "[c"
        execute "normal! ".l:cmd
    else
        let l:cmd = a:way > 0 ? "next" : "prev"
        let l:prefix = empty(getloclist(winnr())) ? "c" : "l"
        silent! execute l:prefix.l:cmd
        normal! zzzv
    endif
endfunction
