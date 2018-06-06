let s:findprg = "/usr/bin/find"

function! find#find(...)
    let l:command = join([s:findprg, join(a:000)])
    call setqflist([], 'r')
    call async#start(l:command, {'out_cb': 'find#qf'})
endfunction

function! find#qf(channel, message)
    call qf#append(a:message, '%f: %m')
endfunction

function find#configure()
    if executable("fd")
        let s:findprg = printf("/usr/bin/fd --full-path --type f --color never --threads %d --hidden --no-ignore --exec file {} \;", default#units())
    endif
endfunction
