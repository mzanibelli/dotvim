function! cmdwin#mode()
    if getcmdwintype() !=# ''
        nnoremap <buffer> <CR> <CR>
        nnoremap <buffer> <Leader>x <CR>q:
        setlocal bufhidden=wipe
    endif
endfunction
