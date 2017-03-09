function! cscope#init()
    if filereadable("./cscope.out")
        set nocsverb
        cs add cscope.out
        set csverb
    endif
endfunction

function! cscope#go(char)
    let l:search = expand("<cword>")
    if !cscope_connection() || l:search ==# ""
        echom "Can't query cscope"
        return
    endif
    try
        call qf#cload("cs find ".a:char." ".l:search)
        call qf#cfirst()
        if a:char ==# "s"
            echom "Found '".l:search."' symbol"
        elseif a:char ==# "g"
            echom "Found '".l:search."' definition"
        elseif a:char ==# "d"
            echom "Found functions called by '".l:search."' function"
        elseif a:char ==# "c"
            echom "Found functions calling '".l:search."' function"
        elseif a:char ==# "t"
            echom "Found '".l:search."' text string"
        elseif a:char ==# "e"
            echom "Found '".l:search."' egrep pattern"
        elseif a:char ==# "f"
            echom "Found '".l:search."' file"
        elseif a:char ==# "i"
            echom "Found files including '".l:search."' file"
        elseif a:char ==# "a"
            echom "Found places where '".l:search."' symbol is assigned a value"
        endif
    catch
        echom "Scope not found"
    endtry
endfunction

function! cscope#menu()
    let l:search = expand("<cword>")
    if l:search ==# ""
        return
    endif
    echo "s : Find '".l:search."' symbol\n"
                \."g : Find '".l:search."' definition\n"
                \."d : Find functions called by '".l:search."' function\n"
                \."c : Find functions calling '".l:search."' function\n"
                \."t : Find '".l:search."' text string\n"
                \."e : Find '".l:search."' egrep pattern\n"
                \."f : Find '".l:search."' file\n"
                \."i : Find files including '".l:search."' file\n"
                \."a : Find places where '".l:search."' symbol is assigned a value"
endfunction
