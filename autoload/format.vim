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

function! format#init()
    setlocal matchpairs-=<:>
    setlocal formatoptions=crqj
    if exists("b:textformat") && b:textformat == 1
        setlocal formatoptions+=tn
        setlocal formatlistpat=^\\s*
        setlocal formatlistpat+=[
        setlocal formatlistpat+=\\[({]\\?
        setlocal formatlistpat+=\\(
        setlocal formatlistpat+=[0-9]\\+
        setlocal formatlistpat+=\\\|[iIvVxXlLcCdDmM]\\+
        setlocal formatlistpat+=\\\|[a-zA-Z]
        setlocal formatlistpat+=\\)
        setlocal formatlistpat+=[\\]:.)}
        setlocal formatlistpat+=]
        setlocal formatlistpat+=\\s\\+
        setlocal formatlistpat+=\\\|^\\s*[-–+o*]\\s\\+
    endif
    if exists("b:mailformat") && b:mailformat == 1
        setlocal formatoptions+=w
    endif
    if exists("b:reformatprg")
        command! -buffer -nargs=0 Lint silent call format#external()
    endif
endfunction

function! format#external()
    let l:command = printf(b:reformatprg, shellescape(expand("%:p")))
    call system(l:command)
    silent! checktime
endfunction
