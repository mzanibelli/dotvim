function! sessions#make()
    let l:dir = fnameescape($HOME."/.vim/session".getcwd())
    let l:file = l:dir.'/session.vim'
    silent! call mkdir(l:dir, "p")
    cclose
    lclose
    silent! execute "mksession! ".l:file
endfunction

function! sessions#load()
    let l:file = fnameescape($HOME."/.vim/session".getcwd()."/session.vim")
    if (filereadable(l:file))
        set noswapfile
        silent! execute 'source '.l:file
        set swapfile
    else
        echom "No session loaded"
    endif
endfunction

function! sessions#disable()
    autocmd! SESSIONS
    nnoremap <buffer> <Leader>, :<C-U>echom "Sessions are disabled"<CR>
endfunction
