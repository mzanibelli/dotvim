function! xxl#init(filename)
    let l:size = getfsize(a:filename)
    if l:size > 10485760 || l:size == -2
        let l:old_ei = &eventignore
        let l:old_ul = &undolevels
        execute "autocmd XXL BufEnter ".a:filename." set ul=-1 ei=FileType nois"
        execute "autocmd XXL BufLeave ".a:filename." set ul=".l:old_ul." ei=".l:old_ei." is"
        execute "autocmd XXL BufUnload ".a:filename." autocmd! XXL * ".a:filename
        setlocal noswapfile
        setlocal bufhidden=unload
        let b:largefile = 1
    endif
endfunction
