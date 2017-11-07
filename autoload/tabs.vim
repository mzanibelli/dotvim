function! tabs#tabline()
    let l:str = ''
    for i in range(tabpagenr('$'))
        let l:tab = i + 1
        let l:bufnr = tabpagebuflist(l:tab)[tabpagewinnr(l:tab) - 1]
        let l:bufname = bufname(l:bufnr)
        let l:selected = l:tab == tabpagenr()
        let l:file = fnamemodify(l:bufname, l:selected ? ':p:~:.' : ':t')
        let l:str .= '%' . l:tab . 'T'
        let l:str .= l:selected ? '%#TabLineSel#' : '%#TabLine#'
        let l:str .= l:bufname != '' ? '['. l:file . '] ' : '[No Name] '
    endfor
    let l:str .= '%#TabLineFill#%T%=%<[%{getcwd()}]'
    return l:str
endfunction
