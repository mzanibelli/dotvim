function! git#dir()
    if !exists("b:gitdir") || empty(b:gitdir)
        let l:file = findfile(".git", ".;", 1)
        let b:gitdir = strlen(l:file) ? git#parse(l:file) : finddir(".git", ".;", 1)
    endif
    return b:gitdir
endfunction

function! git#parse(file)
    let l:file = getftype(a:file) ==# "link" ? resolve(a:file) : a:file
    let l:line = get(readfile(l:file, '', 1), 0, '')
    if l:line =~# '^gitdir: \.'
        return fnamemodify(l:file, ":h")."/".l:line[8:-1]
    endif
    return ''
endfunction

function! git#branch()
    let l:dir = git#dir()
    if strlen(l:dir)
        let l:cmd = printf("git --git-dir=%s rev-parse --abbrev-ref HEAD 2>/dev/null", l:dir)
        return systemlist(l:cmd)[0]
    endif
    return ''
endfunction
