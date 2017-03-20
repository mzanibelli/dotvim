let s:messages = {
            \ 'd': "Found functions called by '%s' function",
            \ 'c': "Found functions calling '%s' function",
            \ 't': "Found '%s' text string",
            \ 'e': "Found '%s' egrep pattern",
            \ 'f': "Found '%s' file",
            \ 'i': "Found files including '%s' file",
            \ 'a': "Found places where '%s' symbol is assigned a value",
            \ 's': "Found '%s' symbol",
            \ 'g': "Found '%s' definition"
        \}

let s:menu = "s : Find symbol\n"
            \ ."g : Find definition\n"
            \ ."d : Find functions called by this function\n"
            \ ."c : Find functions calling this function\n"
            \ ."t : Find text string\n"
            \ ."e : Find egrep pattern\n"
            \ ."f : Find file\n"
            \ ."i : Find files including file\n"
            \ ."a : Find places where symbol is assigned a value"

function! cscope#init()
    if filereadable("./cscope.out")
        call default#save('cscopeverbose', 0, 'cs add cscope.out')
    endif
endfunction

function! cscope#go(char)
    let l:search = expand("<cword>")
    if cscope_connection() && l:search !=# ""
        try
            call qf#cload("cs find ".a:char." ".l:search)
            call qf#cfirst()
            echom printf(s:messages[a:char], l:search)
        catch
            echom "Scope not found"
        endtry
    endif
endfunction

function! cscope#menu()
    let l:search = expand("<cword>")
    if l:search !=# ""
        echo s:menu
    endif
endfunction
