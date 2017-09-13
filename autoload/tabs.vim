function! tabs#tabline()
    let l:str = ''
    for i in range(tabpagenr('$'))
        let l:tab = i + 1
        let l:bufnr = tabpagebuflist(l:tab)[tabpagewinnr(l:tab) - 1]
        let l:bufname = bufname(l:bufnr)
        let l:str .= '%' . l:tab . 'T'
        let l:str .= l:tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
        let l:str .= l:bufname != '' ? '['. fnamemodify(l:bufname, ':t') . '] ' : '[No Name] '
    endfor
    let l:str .= '%#TabLineFill#%T%=%<[%{getcwd()}]'
    return l:str
endfunction
