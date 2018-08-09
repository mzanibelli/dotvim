function! go#test()
    let l:file = expand("%:p")
    if empty(l:file)
        return
    endif
    let l:dir = fnamemodify(l:file, ":h")
    let l:basename = substitute(fnamemodify(l:file, ":t:r"), "_test$", "", "")
    let l:code = printf("%s/%s.go", l:dir, l:basename)
    let l:test = printf("%s/%s_test.go", l:dir, l:basename)
    if l:file ==# l:code
        execute "edit" l:test
    elseif l:file ==# l:test
        execute "edit" l:code
    endif
endfunction
