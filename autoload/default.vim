function! default#init()
    if filereadable("./vimrc.local")
        source ./vimrc.local
    endif
endfunction

function! default#units()
    let l:units = 1
    if executable("nproc")
        let l:units = system('nproc --all | xargs echo -n')
    endif
    return l:units
endfunction

function! default#snippet(abb, exp)
    execute 'inoreabbrev <buffer> <silent> '.a:abb.' '.a:exp.'<Esc>F%s<C-O>:call getchar()<CR>'
endfunction

function! default#getchar(offset)
    return strcharpart(getline('.'), virtcol('.') - (1 + a:offset), 1)
endfunction

function! default#mapdouble(char, replace)
    if default#getchar(1) ==# a:char && default#getchar(2) !=# '\'
        return a:replace
    endif
    return a:char
endfunction
