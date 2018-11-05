function! preview#toggle()
    if !executable("pandoc") || !executable("surf")
        return
    endif
    if exists("b:preview")
        call delete(b:preview)
        unlet b:preview
        unlet b:surfpid
        return
    endif
    let b:preview = tempname()
    call preview#auto()
endfunction

function! preview#auto()
    if !exists("b:preview")
        return
    endif
    let l:file = shellescape(expand("%"))
    let l:cmd = printf("pandoc -f markdown -t html %s > %s", l:file, b:preview)
    call system(l:cmd)
    if exists("b:surfpid")
        silent call system(printf("kill -HUP %d", b:surfpid))
        return
    endif
    let l:job = async#job(printf("surf %s", b:preview))
    let l:info = job_info(l:job)
    let b:surfpid = l:info.process
endfunction
