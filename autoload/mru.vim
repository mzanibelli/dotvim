function! mru#list()
    belowright 30new
    silent 0put =v:oldfiles
    normal! Gddgg
    setlocal filetype=mru
endfunction

function! mru#open()
    let l:file = getline(".")
    close
    execute 'edit '.l:file
endfunction
