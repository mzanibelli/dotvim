let s:findprg = "/usr/bin/find"

function! find#find(...)
    let l:command = join([s:findprg, join(a:000)])
    call async#start(l:command, 'find#qf')
endfunction

function! find#qf(channel)
    let l:command = printf("cgetfile %s", g:bgoutput)
    call default#save('errorformat', shellescape('%f'), l:command)
    call async#end(a:channel)
endfunction

function find#configure()
    if executable("fd")
        let s:findprg = printf("/usr/bin/fd --full-path --color never --threads %d --hidden --no-ignore", default#units())
    endif
endfunction
