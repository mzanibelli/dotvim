function! objects#append(type)
    call feedkeys("`]a", 'n')
endfunction

function! objects#prepend(type)
    call feedkeys("`[i", 'n')
endfunction

function! objects#nextobject(motion, dir)
    let l:char = nr2char(getchar())
    if l:char ==# "b"
        let l:char = "("
    elseif l:char ==# "B"
        let l:char = "{"
    elseif l:char ==# "d"
        let l:char = "["
    endif
    execute "normal! ".a:dir.l:char."v".a:motion.l:char
endfunction
