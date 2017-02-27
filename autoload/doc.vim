function! doc#browse()
    if executable("firefox")
        if &ft == "php"
            silent execute "!firefox https://php.net/manual-lookup.php?pattern=".expand("<cword>")
        elseif &ft == "python"
            silent execute "!firefox https://docs.python.org/2.7/search.html?q=".expand("<cword>")
        elseif &ft == "go"
            silent execute "!firefox https://golang.org/search?q=".expand("<cword>")
        else
            silent execute "!firefox https://www.google.com/search?q=".&ft."+".expand("<cword>")
        endif
        redraw!
    endif
endfunction
