function! mru#ls(dir)
    let l:dir = expand(a:dir)
    if !isdirectory(l:dir)
        return
    endif
    let l:files = globpath(l:dir, "*", 0, 1)
    call mru#files(l:files)
endfunction

function! mru#open(command)
    let l:file = getline(".")
    execute a:command fnameescape(l:file)
endfunction

function! mru#files(files)
    call mru#setcontent(a:files)
    call cursor(1, 1)
    setlocal filetype=mru
endfunction

function! mru#setcontent(files)
    if &ft ==# "mru"
        setlocal modifiable
    endif
    silent call deletebufline('%', 1, '$')
    call append(0, map(copy(a:files), 'fnamemodify(v:val, ":p:.")'))
    silent call deletebufline('%', '$')
    if &ft ==# "mru"
        setlocal nomodifiable
        setlocal nomodified
    endif
endfunction

function! mru#complete(a, l, p)
    return map(filter(copy(v:oldfiles), "v:val =~? a:a"), "fnamemodify(v:val, ':p:.')")
endfunction
