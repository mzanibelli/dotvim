function! format#format()
    set ff=unix
    %retab!
    call format#trim()
    call windows#preserve('%s/\n\{2,\}/\r\r/g')
endfunction

function! format#alerts(cache)
    if exists("b:largefile")
        return 0
    endif
    if !a:cache
        unlet! b:wrongformat
    endif
    if !exists("b:wrongformat")
        let l:trail = search('\s\+$', 'nw') != 0
        let l:tabs = search('^\t', 'nw') != 0
        let l:spaces = search('^ ', 'nw') != 0
        let b:wrongformat = l:trail || (l:tabs && l:spaces) || (&et && l:tabs) || (!&et && l:spaces)
    endif
    return b:wrongformat
endfunction

function! format#fix()
    if format#alerts(0)
        call format#trim()
        call windows#preserve("%retab!")
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
