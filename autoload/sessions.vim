function! sessions#make()
    if !exists("b:nosession") || b:nosession == 0
        let l:dir = fnameescape("/tmp/vim/session".getcwd())
        let l:file = l:dir.'/session.vim'
        silent! call mkdir(l:dir, "p")
        cclose
        lclose
        silent! execute "mksession! ".l:file
    endif
endfunction

function! sessions#load()
    if !exists("b:nosession") || b:nosession == 0
        let l:file = fnameescape("/tmp/vim/session".getcwd()."/session.vim")
        if (filereadable(l:file))
            silent! call default#save('swapfile', 0, printf("source %s", l:file))
        endif
    endif
endfunction
