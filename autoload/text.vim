function! text#mode()
    let b:textformat=1
    let b:completiontype="\<C-X>\<C-K>"
    let b:autoclose = ['quote']
    setlocal nonumber
    setlocal textwidth=60
    setlocal spell
endfunction
