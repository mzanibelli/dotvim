let s:source_types = ["git","svn"]

function! source#root()
    let l:cmd = haslocaldir() ? "lcd" : "cd"
    for type in s:source_types
        let l:dir = finddir(".".type, ".;", 1)
        if strlen(l:dir)
            execute l:cmd fnamemodify(l:dir, ":h")
            break
        endif
    endfor
    echom getcwd()
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
