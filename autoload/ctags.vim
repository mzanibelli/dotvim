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
        echom "Tag '".l:tag."' not found"
    endtry
endfunction

function! ctags#generate()
    let l:file = default#extra()."/ctags/".&ft
    if file_readable(l:file)
        call async#start(l:file, "async#end")
    else
        echom "Unknown file type"
    endif
endfunction
