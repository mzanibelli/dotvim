function! default#units()
    if !exists("g:units")
        let g:units = executable("nproc") ? system('nproc --all | xargs echo -n') : 1
    endif
    return g:units
endfunction

function! default#getchar(offset)
    return nr2char(strgetchar(matchstr(getline('.'), repeat('.', a:offset).'\%'.col('.').'c'), 0))
endfunction

function! default#mapdouble(char, replace)
    if default#getchar(1) ==# a:char && default#getchar(2) !=# '\'
        return a:replace
    endif
    return a:char
endfunction

function! default#extra()
    return fnamemodify(expand(resolve($MYVIMRC)), ":h")."/extra"
endfunction

function! default#dirmatches(dir, a)
    let l:matches = []
    for file in split(glob(a:dir."/*"), "\n")
        let l:tail = fnamemodify(file, ':t')
        if l:tail =~# '^'.a:a
            let l:matches = add(l:matches, l:tail)
        endif
    endfor
    return l:matches
endfunction

function! default#gettext(start_pos, end_pos)
    let [line_start, column_start] = getpos(a:start_pos)[1:2]
    let [line_end, column_end] = getpos(a:end_pos)[1:2]
    let l:lines = getline(line_start, line_end)
    if len(l:lines) == 0
        return ''
    endif
    let l:lines[-1] = l:lines[-1][: column_end - 1]
    let l:lines[0] = l:lines[0][column_start - 1:]
    return join(l:lines, "\n")
endfunction
