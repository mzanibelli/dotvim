function! mru#popup()
    if bufnr("MRU") == -1
        belowright 30new
        call mru#files()
        let b:mrusplit = 1
    endif
endfunction

function! mru#open()
    let l:file = getline(".")
    if exists("b:mrusplit") && b:mrusplit == 1
        close
    endif
    execute 'edit '.l:file
endfunction

function! mru#files()
    silent 0put =v:oldfiles
    normal! Gddgg
    setlocal filetype=mru
    file MRU
endfunction
