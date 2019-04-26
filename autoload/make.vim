function! make#auto(file)
    if empty(a:file) | return | endif
    if exists("g:nocompile") && g:nocompile == 1 | return | endif
    if !exists("b:autocompile") || b:autocompile == 0 | return | endif
    let l:command = join([&makeprg, shellescape(fnamemodify(a:file, ":p"))])
    lexpr join(systemlist(l:command), '\n')
    silent checktime
endfunction

function! make#toggle()
    if exists("g:nocompile")
        let g:nocompile = 1 - g:nocompile
    else
        let g:nocompile = 1
    endif
endfunction
