function! toggle#map(key, opt)
    let l:cmd = ':\<C-U>set '.a:opt.'! \| redrawstatus! \| set '.a:opt.'?<CR>'
    exec 'nnoremap '.a:key.' '.l:cmd
    exec 'inoremap '.a:key." \<C-O>".l:cmd
endfunction
