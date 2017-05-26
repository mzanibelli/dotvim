function! defer#load(timer)
    if !exists("g:deferred") || g:deferred == 0
        doautocmd User DeferPost
        let g:deferred = 1
    endif
endfunction
