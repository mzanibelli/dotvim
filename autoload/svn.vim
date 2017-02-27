function! svn#diff(...)
    if git#tracked(expand("%"))
        let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
        call shell#exec("svn diff ".l:args." %", 0)
    endif
endfunction

function! svn#log(...)
    if git#tracked(expand("%"))
        let l:default = "-l 10"
        let l:args = a:0 > 0 ? a:1 ==# "" ? l:default : shellescape(a:1, 1) : l:default
        call shell#exec("svn log ".l:args." % | less", 0)
    endif
endfunction

function! svn#blame()
    if git#tracked(expand("%"))
        let l:line = line(".")
        setlocal nowrap nofoldenable
        aboveleft 18vnew
        %!svn blame -x-w "#" | cut -c 1-18
        setlocal nomodified readonly buftype=nofile nowrap nonumber winfixwidth bufhidden=wipe
        execute "normal! " . l:line . "gg"
        setlocal scrollbind
        wincmd p
        setlocal scrollbind
        syncbind
    endif
endfunction

function! svn#revert()
    if git#tracked(expand("%"))
        if confirm("Revert file ?", "&Yes\n&No") == 1
            call shell#exec("svn revert %", 0)
        endif
    endif
endfunction

function! svn#mappings()
    nnoremap <silent> <Leader>? :<C-U>call svn#diff()<CR>
    nnoremap <silent> <Leader>+ :<C-U>call svn#log()<CR>
    nnoremap <silent> <Leader>! :<C-U>call svn#blame()<CR>
    nnoremap <silent> <Leader>$ :<C-U>call svn#revert()<CR>
endfunction

function! git#tracked(file)
    if shell#exec("svn info ".fnameescape(a:file), 1) == 0
        echom "Not an SVN repository"
        return 0
    endif
    return 1
endfunction

