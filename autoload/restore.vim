function! restore#position()
    if !exists("b:norestore") || b:norestore == 0
        if line("'\"") > 0 && line("'\"") <= line("$")
            execute "normal! g'\""
        endif
    endif
endfunction
