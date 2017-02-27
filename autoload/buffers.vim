function! buffers#killall()
    let l:count = 0
    for b in range(1, bufnr("$"))
        if bufexists(b) && bufwinnr(b) == -1
            try
                silent execute "bwipeout ".b
                let l:count += 1
            catch
                execute "buffer ".b
                return
            endtry
        endif
    endfor
    echom "Deleted " . l:count . " buffers"
endfunction
