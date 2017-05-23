function! ctags#go(...)
    let l:tag = a:0 > 0 ? a:1 : expand("<cword>")
    try
        silent execute "ltag ".l:tag
        call qf#lfirst()
        echom "Found tag '".l:tag."'"
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
