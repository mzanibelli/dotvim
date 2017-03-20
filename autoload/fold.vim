function! fold#next()
    let l:pos = getpos(".")
    execute "normal! 1\<C-I>"
    if getpos(".") == l:pos
        execute "normal! zj"
    endif
endfunction

function! fold#toggleall()
    if &foldenable
        normal! zi
    else
        normal! zX
    endif
endfunction

function! fold#toggle()
    if &foldenable
        silent! normal! zA
    else
        normal! zX
    endif
endfunction

function! fold#method(line)
    if getline(a:line) =~# '\v^\s*$'
        return '-1'
    endif
    let l:indent = indent(a:line) / &shiftwidth
    if l:indent < 2
        return '0'
    endif
    return '2'
endfunction

function! fold#bypass(command)
    let l:old_fold = &foldenable
    set nofoldenable
    execute a:command
    let &foldenable = l:old_fold
    if foldclosed('.') != -1
        normal! zA
    endif
endfunction
