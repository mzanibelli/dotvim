function! ctags#go(...)
    let l:tag = a:0 > 0 ? a:1 : expand("<cword>")
    try
        call qf#lload("ltag ".l:tag)
        echom "Found tag '".l:tag."'"
    catch
        echom "Tag '".l:tag."' not found"
    endtry
endfunction
