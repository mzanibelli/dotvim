let s:findprg = "/usr/bin/find"

function! find#find(...)
    let l:command = join([s:findprg, join(a:000)])
    call async#start(l:command, {'out_cb': 'find#qf'})
endfunction

function! find#qf(channel, message)
    let l:efm = &errorformat
    try
        let &errorformat = '%f: %m'
        call qf#append(a:message)
    finally
        let &errorformat = l:efm
    endtry
endfunction

function find#configure()
    if executable("fd")
        let s:findprg = printf("/usr/bin/fd --full-path --type f --color never --threads %d --hidden --no-ignore --exec file {} \;", default#units())
    endif
endfunction
