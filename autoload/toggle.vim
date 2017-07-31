function! toggle#map(key, opt)
    let l:cmd = ':<C-U>set '.a:opt.'! \| redrawstatus!<CR>'
    exec 'nnoremap <silent> '.a:key.' '.l:cmd
    exec 'inoremap <silent> '.a:key.' <C-O>'.l:cmd
endfunction
