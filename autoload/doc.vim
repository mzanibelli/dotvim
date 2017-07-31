function! doc#browse(search)
    let l:search = substitute(a:search, ' ', '+', '')
    if &ft == "php"
        silent execute "!$BROWSER https://php.net/manual-lookup.php?pattern=".l:search
    elseif &ft == "python"
        silent execute "!$BROWSER https://docs.python.org/2.7/search.html?q=".l:search
    elseif &ft == "go"
        silent execute "!$BROWSER https://golang.org/search?q=".l:search
    elseif &ft == "sh"
        silent execute "!$BROWSER http://explainshell.com/explain?cmd=".l:search
    else
        silent execute "!$BROWSER https://duckduckgo.com/?q=".&ft."+".l:search
    endif
    redraw!
endfunction
