function! mru#popup()
    if bufnr("MRU") != -1
        return
    endif
    belowright 30new
    call mru#files(v:oldfiles)
    setlocal winfixheight
    let b:mrusplit = 1
endfunction

function! mru#open(command)
    let l:file = getline(".")
    if exists("b:mrusplit") && b:mrusplit == 1
        close
    endif
    execute a:command fnameescape(l:file)
endfunction

function! mru#files(files)
    call append(0, a:files)
    silent execute line('$') 'delete' '_'
    call cursor(1, 1)
    setlocal filetype=mru
    silent file MRU
endfunction

function! mru#complete(a, l, p)
    return map(filter(copy(v:oldfiles), "v:val =~? a:a"), "fnamemodify(v:val, ':.')")
endfunction
