function! windows#preserve(command)
    let l:view = winsaveview()
    execute "keeppatterns silent! ".a:command
    call winrestview(l:view)
endfunction
