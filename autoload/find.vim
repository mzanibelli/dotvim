let s:findprg = '/usr/bin/fd --full-path --type f --color never --hidden --no-ignore --exec file {} \;'
let s:findformat = '%f: %m'

function! find#find(...)
    call qf#system(join([s:findprg, join(a:000)]), s:findformat)
endfunction
