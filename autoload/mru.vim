function! mru#list()
    belowright 30new
    silent 0put =v:oldfiles
    normal! Gddgg
    setlocal filetype=mru
endfunction

function! mru#open()
    execute 'edit '.getline(".")
endfunction
