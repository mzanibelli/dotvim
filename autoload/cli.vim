function! cli#override(abb, exp, ...)
    let l:buf = a:0 > 0 ? a:1 : 0
    execute 'cnoreabbr '.(l:buf ? "<buffer> " : "").a:abb.' <C-R>=getcmdpos() == 1 && getcmdtype() == ":" ? "'.a:exp.'" : "'.a:abb.'"<CR>'
endfunction

function! cli#cr()
    if wildmenumode()
        return "\<C-]>"
    endif
    let l:cmdline = getcmdline()
    if l:cmdline =~# '\v\C^(ls|files|buffers)'
        return "\<CR>:buffer "
    elseif l:cmdline =~# '\v\C/(#|nu%[mber])$'
        return "\<CR>:"
    elseif l:cmdline =~# '\C^marks'
        return "\<CR>:normal! `"
    elseif l:cmdline =~# '\v\C^(dli%[st]|il%[ist])'
        return cli#listpostcmd(l:cmdline)
    elseif l:cmdline =~# '\v\C^undol%[ist]'
        return "\<CR>:undo "
    endif
    return "\<C-]>\<CR>"
endfunction

function! cli#listpostcmd(cmdline)
    let l:search = matchstr(a:cmdline, '/.*')
    let l:result = "\<CR>:" . a:cmdline[0] . "jump  " . l:search
    let l:i = 0
    while l:i <= strlen(l:search)
        let l:result .= "\<Left>"
        let l:i += 1
    endwhile
    return l:result
endfunction
