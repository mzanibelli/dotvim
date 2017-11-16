function! mru#popup()
    if bufnr("MRU") == -1
        belowright 30new
        call mru#files()
        setlocal winfixheight
        let b:mrusplit = 1
    endif
endfunction

function! mru#open(command)
    let l:file = getline(".")
    if exists("b:mrusplit") && b:mrusplit == 1
        close
    endif
    execute a:command fnameescape(l:file)
endfunction

function! mru#files()
    silent 0put =v:oldfiles
    normal! Gddgg
    setlocal filetype=mru
    silent file MRU
endfunction
