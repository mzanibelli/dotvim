function! headers#write()
    if exists("b:headerstring")
        let l:header = b:headerstring
    else
        let l:header = '#!/bin/'.&ft
    endif
    return ":\<C-U>let view=winsaveview()\<CR>ggO".l:header."\<Esc>:call winrestview(view)\<CR>"
endfunction
