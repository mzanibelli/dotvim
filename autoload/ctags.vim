function! ctags#go(...)
    let l:tag = a:0 > 0 ? a:1 : expand("<cword>")
    try
        call qf#lload("ltag ".l:tag)
        call qf#lfirst()
        echom "Found tag '".l:tag."'"
    catch
        echom "Tag '".l:tag."' not found"
    endtry
endfunction

function! ctags#command()
    if exists("b:ctagscommand")
        return b:ctagscommand
    else
        let l:file = fnamemodify(expand(resolve($MYVIMRC)), ":h")."/extra/ctags/".&ft
        if file_readable(l:file)
            return l:file
        endif
    endif
    return 'ctags'
endfunction

function! ctags#generate()
    call async#start(ctags#command(), "async#end")
endfunction
