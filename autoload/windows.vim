function! windows#preserve(command)
    let l:view = winsaveview()
    execute "keeppatterns silent! ".a:command
    call winrestview(l:view)
endfunction

function! windows#move(key)
    let t:curwin = winnr()
    execute "wincmd" a:key
    if (t:curwin == winnr())
        execute "wincmd" a:key =~# "[jk]" ? "s" : "v"
        execute "wincmd" a:key
    endif
endfunction
