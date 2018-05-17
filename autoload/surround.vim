function! surround#autoclose()
    if exists("b:autoclose")
        if index(b:autoclose, 'expansion') >= 0
            inoremap <buffer> {<CR> {<CR>}<Esc>O<Tab>
            inoremap <buffer> [<CR> [<CR>]<Esc>O<Tab>
            inoremap <buffer> (<CR> (<CR>)<Esc>O<Tab>
        endif
        if index(b:autoclose, 'square') >= 0
            inoremap <buffer> ["" [""]<Left><Left>
            inoremap <buffer> ['' ['']<Left><Left>
        endif
        if index(b:autoclose, 'args') >= 0
            inoremap <buffer> ("" ("")<Left><Left>
            inoremap <buffer> ('' ('')<Left><Left>
        endif
        if index(b:autoclose, 'quote') >= 0
            inoremap <buffer> <expr> " default#mapdouble('"', "\"\<Left>")
            inoremap <buffer> <expr> ' default#mapdouble("'", "'\<Left>")
        endif
        if index(b:autoclose, 'doublecurly') >= 0
            inoremap <buffer> {{}} {{<Space><Space>}}<Left><Left><Left>
        endif
        if index(b:autoclose, 'doublesquare') >= 0
            inoremap <buffer> [[]] [[<Space><Space>]]<Left><Left><Left>
        endif
        if index(b:autoclose, 'parentheses') >= 0
            inoremap <buffer> () ()<Left>
        endif
    endif
endfunction
