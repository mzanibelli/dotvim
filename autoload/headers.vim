function! headers#write()
    if &ft ==# "yaml"
        let l:header = '---'
    elseif &ft ==# "php"
        let l:header = '#!/usr/bin/php'
    elseif &ft ==# "ruby"
        let l:header = '#!/usr/bin/ruby'
    elseif &ft ==# "python"
        let l:header = '#!/usr/bin/python2'
    elseif &ft ==# "sh"
        let l:header = '#!/bin/bash'
    else
        let l:header = '#!/bin/'.&ft
    endif
    return ":\<C-U>let view=winsaveview()\<CR>ggO".l:header."\<Esc>:call winrestview(view)\<CR>"
endfunction
