nnoremap <silent> <Leader>a :set opfunc=objects#append<CR>g@
nnoremap <silent> <Leader>i :set opfunc=objects#prepend<CR>g@

for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%' ]
    execute 'vnoremap <silent> i'.char.' :<C-U>normal! T'.char.'vt'.char.'<CR>'
    execute 'onoremap <silent> i'.char.' :<C-U>normal vi'.char.'<CR>'
    execute 'vnoremap <silent> a'.char.' :<C-U>normal! F'.char.'vf'.char.'<CR>'
    execute 'onoremap <silent> a'.char.' :<C-U>normal va'.char.'<CR>'
endfor

for motion in [ 'i', 'a' ]
    for direction in [ 'f', 'F' ]
        execute 'onoremap <silent> '.motion.(direction ==# 'f' ? 'n' : 'l').' :<C-U>call objects#nextobject("'.motion.'", "'.direction.'")<CR>'
        execute 'vnoremap <silent> '.motion.(direction ==# 'f' ? 'n' : 'l').' :<C-U>call objects#nextobject("'.motion.'", "'.direction.'")<CR>'
    endfor
endfor
