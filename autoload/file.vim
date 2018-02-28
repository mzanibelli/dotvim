function! file#size()
    let l:bytes = getfsize(expand("%:p"))
    if l:bytes < 1024
        return printf('%sB', l:bytes <= 0 ? 0 : l:bytes)
    endif
    return printf('%sKB', l:bytes / 1024)
endfunction

function! file#mkdir(file, buf)
    let l:dir = fnamemodify(a:file, ':h')
    if empty(getbufvar(a:buf, '&buftype')) && a:file !~# '\v^\w+\:\/'
        if !isdirectory(l:dir)
            echom "Directory '".l:dir."' doesn't exist"
            if confirm("Create it ?", "&Yes\n&No") == 1
                try
                    call mkdir(l:dir, "p")
                catch
                    echo v:exception
                endtry
            endif
        endif
    endif
endfunction

function! file#backupext()
    execute "set backupext=.".strftime("%Y%m%d%H%M%S")
endfunction

function! file#path()
    let l:path = expand("%:p")
    call setreg("+", l:path)
    echo l:path
endfunction

function! file#move(name) abort
    let l:old = expand("%:p")
    setlocal modified
    silent execute "saveas!" a:name
    silent execute printf("%dbwipe!", bufnr("$"))
    if l:old !=# expand("%:p") && filewritable(l:old)
        call delete(l:old)
    endif
endfunction

function! file#delete() abort
    let l:path = expand("%:p")
    if filewritable(l:path)
        call delete(l:path)
        bwipe!
    endif
endfunction

function! file#readonly()
    return &readonly || !&modifiable
endfunction
