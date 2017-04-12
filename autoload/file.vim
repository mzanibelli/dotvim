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
                    echom "Can't create '".l:dir."'"
                endtry
            endif
        endif
    endif
endfunction

function! file#backupext()
    execute "set backupext=.".strftime("%Y%m%d%H%M%S")
endfunction

function! file#mrulist()
    if @% == ""
        setlocal nomodified readonly buftype=nofile nowrap nonumber winfixheight bufhidden=wipe
        0put =v:oldfiles
        nnoremap <silent> <buffer> <CR> :<C-U>call file#mruopen()<CR>
    endif
endfunction

function! file#mruopen()
    execute 'edit '.getline(".")
endfunction
