function! format#format()
    set ff=unix
    %retab!
    call format#trim()
    call windows#preserve('%s/\n\{2,\}/\r\r/g')
endfunction

function! format#alerts(cache)
    if exists("b:large_file")
        return 0
    endif
    if !a:cache
        unlet! b:format
    endif
    if !exists("b:format")
        let l:trail = search('\s\+$', 'nw') != 0
        let l:tabs = search('^\t', 'nw') != 0
        let l:spaces = search('^ ', 'nw') != 0
        let b:format = l:trail || (l:tabs && l:spaces) || (&et && l:tabs) || (!&et && l:spaces)
    endif
    return b:format
endfunction

function! format#fix()
    if format#alerts(0)
        call format#trim()
        call windows#preserve("%retab!")
        update
    endif
endfunction

function! format#trim()
    call windows#preserve('%s/\s\+$//e')
endfunction

function! format#forceoptions()
    setlocal matchpairs-=<:>
    setlocal formatoptions=crqj
    if exists("b:textformat") && b:textformat == 1
        setlocal formatoptions+=tn
    endif
endfunction
