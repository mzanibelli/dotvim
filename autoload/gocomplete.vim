function! gocomplete#complete(findstart, base)
    if a:findstart != 1
        return g:gocomplete_completions[1]
    endif
    execute "silent let g:gocomplete_completions = " . gocomplete#completions()
    return col('.') - g:gocomplete_completions[0] - 1
endfunction

function! gocomplete#buffer()
    let l:buf = getline(1, '$')
    let l:file = tempname()
    call writefile(l:buf, file)
    return l:file
endfunction

function! gocomplete#command(cmd, preargs, args)
    let l:preargs = join(map(a:preargs, {k, v -> shellescape(v)}))
    let l:args = join(map(a:args, {k, v -> shellescape(v)}))
    let l:command = printf('gocode %s %s %s', l:preargs, a:cmd, l:args)
    let l:result = system(l:command)
    if v:shell_error != 0
        return "[\"0\", []]"
    endif
    return l:result
endfunction

function! gocomplete#cursor()
    return printf('%d', line2byte(line('.')) + col('.') - 2)
endfunction

function! gocomplete#completions()
    let l:filename = gocomplete#buffer()
    let l:preargs = ['-in=' . l:filename, '-f=vim']
    let l:args = [expand('%:p'), gocomplete#cursor()]
    let l:result = gocomplete#command('autocomplete', l:preargs, l:args)
    return l:result
endfunction
