function! file#size()
    let l:bytes = getfsize(expand("%:p"))
    if l:bytes <= 0
        return "0B"
    endif
    if l:bytes < 1024
        return l:bytes."B"
    endif
    let l:kilobytes = l:bytes / 1024
    return l:kilobytes . "KB"
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
                    echom "Can't create '".l:dir."'"
                endtry
            endif
        endif
    endif
endfunction

function! file#backupext()
    execute "set backupext=.".strftime("%Y%m%d%H%M%S")
endfunction
