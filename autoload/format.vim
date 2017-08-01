function! format#auto()
    if exists("b:autoformat") && b:autoformat == 1
        call format#reformat()
    endif
endfunction

function! format#alerts(cache)
    if &modifiable && !exists("b:largefile")
        if !exists("b:wrongformat") || !a:cache
            let l:type = &ff !=# "unix"
            let l:trail = search('\s\+$', 'nw') != 0
            let l:tabs = search('^\t', 'nw') != 0
            let l:spaces = search('^ ', 'nw') != 0
            let b:wrongformat = l:type || l:trail || (l:tabs && l:spaces) || (&et && l:tabs) || (!&et && l:spaces)
        endif
        return b:wrongformat
    endif
    return 0
endfunction

function! format#reindent()
    call windows#preserve("normal! gg=G")
endfunction

function! format#reformat()
    call windows#preserve("normal! gggqG")
endfunction

function! format#trim()
    call windows#preserve('%s/\s\+$//e')
endfunction

function! format#pack()
    call windows#preserve('%s/\n\{2,\}/\r\r/g')
endfunction

function! format#retab()
    call windows#preserve("%retab!")
endfunction

function! format#fix()
    setlocal ff=unix
    call format#retab()
    call format#trim()
endfunction

function! format#forceoptions()
    setlocal matchpairs-=<:>
    setlocal formatoptions=crqj
    if exists("b:textformat") && b:textformat == 1
        setlocal formatoptions+=tn
    endif
endfunction
