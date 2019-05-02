function! make#guard(file)
    if empty(a:file)
        return v:true
    elseif exists("g:nocompile") && g:nocompile == 1
        return v:true
    elseif !exists("b:autocompile") || b:autocompile == 0
        return v:true
    elseif !filewritable(a:file)
        return v:true
    endif
    return v:false
endfunction

function! make#auto(file)
    if make#guard(a:file) | return | endif
    let l:command = join([&makeprg, fnamemodify(a:file, ":p:S")])
    let l:options = {"efm": &errorformat, "lines": systemlist(l:command)}
    call setloclist(bufwinnr(a:file), [], 'r', l:options)
    silent checktime
    lwindow
endfunction

function! make#toggle()
    let g:nocompile = 1 - g:nocompile
endfunction
