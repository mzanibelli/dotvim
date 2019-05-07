function! tabs#tabline()
    let l:str = ''
    for i in range(tabpagenr('$'))
        let l:tab = i + 1
        let l:bufnr = tabpagebuflist(l:tab)[tabpagewinnr(l:tab) - 1]
        let l:bufname = bufname(l:bufnr)
        let l:selected = l:tab == tabpagenr()
        let l:str .= '%' . l:tab . 'T'
        let l:str .= l:selected ? '%#TabLineSel#' : '%#TabLine#'
        let l:file = fnamemodify(l:bufname, isdirectory(l:bufname) ? ":p:h:t" : ":p:t")
        let l:str .= l:bufname != '' && !empty(l:file) ? '['. l:file . '] ' : '[No Name] '
    endfor
    let l:str .= '%#TabLineFill#%T%=%<'
    return l:str
endfunction
