let s:source_types = ["git","svn"]

function! source#exec(command)
    if exists("g:sourcetype")
        let l:file = expand("%")
        if a:command =~# '\v^_' || (l:file !=# "" && eval(g:sourcetype."#tracked('".l:file."')") == 1)
            execute "call ".g:sourcetype."#".substitute(a:command, '_', '', '')."()"
            return
        endif
    endif
    echom "VCS control not available"
endfunction

function! source#init()
    let l:oldcwd = getcwd()
    let l:path = l:oldcwd
    while l:path !=# "/"
        for type in s:source_types
            if isdirectory(l:path."/.".type)
                let g:sourcetype = type
                doautocmd User SourceDetectPost
                return
            endif
        endfor
        execute "cd ".fnameescape(l:path)."/.."
        let l:path = getcwd()
    endwhile
    execute "cd ".fnameescape(l:oldcwd)
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
