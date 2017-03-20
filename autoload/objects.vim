let s:aliases = {'b': '(','B': '{'}

function! objects#append(type)
    call feedkeys("`]a", 'n')
endfunction

function! objects#prepend(type)
    call feedkeys("`[i", 'n')
endfunction

function! objects#nextobject(motion, dir)
    let l:input = nr2char(getchar())
    let l:char = get(s:aliases, l:input, l:input)
    execute "normal! ".a:dir.l:char."v".a:motion.l:char
endfunction
