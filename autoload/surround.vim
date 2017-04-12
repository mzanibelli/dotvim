function! surround#autoclose()
    if exists("b:autoclose")
        if index(b:autoclose, 'curly') >= 0
            inoremap <buffer> {<CR> {<CR><BS>}<Esc>O
        endif
        if index(b:autoclose, 'square') >= 0
            inoremap <buffer> ["" [""]<Left><Left>
            inoremap <buffer> ['' ['']<Left><Left>
        endif
        if index(b:autoclose, 'quote') >= 0 && v:version >= 800
            inoremap <buffer> <expr> " default#mapdouble('"', "\"\<Left>")
            inoremap <buffer> <expr> ' default#mapdouble("'", "'\<Left>")
        endif
        if index(b:autoclose, 'tpl') >= 0
            inoremap <buffer> {{}} {{<Space><Space>}}<Left><Left><Left>
        endif
        if index(b:autoclose, 'tag') >= 0
            inoremap <buffer> <silent> > ><C-R>=xml#close()<CR>
        endif
        if index(b:autoclose, 'shell') >= 0
            inoremap <buffer> [[]] [[<Space><Space>]]<Left><Left><Left>
        endif
        if index(b:autoclose, 'bracket') >= 0
            inoremap <buffer> () ()<Left>
        endif
    endif
endfunction
