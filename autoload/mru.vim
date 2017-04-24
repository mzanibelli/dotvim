function! mru#list()
    belowright 30new
    call mru#files()
    let b:mrusplit = 1
endfunction

function! mru#open()
    let l:file = getline(".")
    if exists("b:mrusplit") && b:mrusplit = 1
        close
    endif
    execute 'edit '.l:file
endfunction

function! mru#files()
    silent 0put =v:oldfiles
    normal! Gddgg
    setlocal filetype=mru
endfunction
