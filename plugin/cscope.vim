" Commands
command! -nargs=1 Scope call cscope#go(<q-args>)

" Mappings
nnoremap \<Leader>th :\<C-U>call cscope#menu()\<CR>:Scope<Space>
for char in [ "c", "d", "g", "s", "t", "e", "i", "a", "f"]
    execute 'nnoremap <Leader>t'.char.' :<C-U>call cscope#go("'.char.'")<CR>'
endfor

" Autocommands
augroup CSCOPE
    autocmd!
    autocmd User SourceDetectPost call cscope#init()
augroup END
