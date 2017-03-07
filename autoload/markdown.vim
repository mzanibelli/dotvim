function! markdown#render()
    call shell#exec("pandoc % \| w3m -T text/html", 0)
endfunction
