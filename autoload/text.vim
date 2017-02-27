function! text#mode()
    call surround#lightweight()
    setlocal nonumber
    setlocal formatoptions+=tn
    setlocal textwidth=60
    setlocal spell
endfunction
