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

function! ctags#generate()
    if exists("b:ctagscommand")
        let l:command = printf("%s -f %s/tags", b:ctagscommand, shellescape(getcwd()))
        call async#start(l:command, "async#end")
    endif
endfunction
