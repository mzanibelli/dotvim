function! default#units()
    let l:units = 1
    if executable("nproc")
        let l:units = system('nproc --all | xargs echo -n')
    endif
    return l:units
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

function! default#save(option, value, command)
    execute "let l:value = &".a:option
    execute "let &".a:option." = ".a:value
    execute a:command
    execute "let &".a:option." = l:value"
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

