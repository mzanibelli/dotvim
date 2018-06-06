let s:findprg = "/usr/bin/find"

function! find#find(...)
    let l:command = join([s:findprg, join(a:000)])
    call setqflist([], 'f')
    call async#start(l:command, 'find#qf')
endfunction

function! find#qf(channel, message)
    let l:command = printf('caddexpr "%s"', escape(a:message, '"'))
    call default#save('errorformat', shellescape('%f'), l:command)
endfunction

function find#configure()
    if executable("fd")
        let s:findprg = printf("/usr/bin/fd --full-path --type f --color never --threads %d --hidden --no-ignore", default#units())
    endif
endfunction
