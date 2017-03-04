function! cli#override(abb, exp, ...)
    let l:buf = a:0 > 0 ? a:1 : 0
    execute 'cnoreabbr '.(l:buf ? "<buffer> " : "").a:abb.' <C-R>=getcmdpos() == 1 && getcmdtype() == ":" ? "'.a:exp.'" : "'.a:abb.'"<CR>'
endfunction

function! cli#stab()
    if getcmdtype() == "/"
        return "\<CR>/\<C-R>/\<CR>?\<C-R>/"
    elseif getcmdtype() == "?"
        return "\<CR>?\<C-R>/\<CR>/\<C-R>/"
    elseif wildmenumode()
        return "\<S-Tab>"
    endif
    return "\<C-\>esplit(getcmdline(), ' ')[0]\<CR>\<C-E>\<Space>"
endfunction

function! cli#cr()
    let l:cmdline = getcmdline()
    if l:cmdline =~# '\v\C^(ls|files|buffers)'
        return "\<CR>:buffer "
    elseif l:cmdline =~# '\v\C/(#|nu%[mber])$'
        return "\<CR>:"
    elseif l:cmdline =~# '\C^marks'
        return "\<CR>:normal! `"
    elseif l:cmdline =~# '\v\C^(dli%[st]|il%[ist])'
        return "\<CR>:" . l:cmdline[0] . "j  " . split(l:cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif l:cmdline =~# '\v\C^undol%[ist]'
        return "\<CR>:undo "
    endif
    return "\<C-]>\<CR>"
endfunction
