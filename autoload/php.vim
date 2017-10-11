function! php#funcregex()
    return '\(.*\%#\)\@!\_^\s*\zs\(\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\)'
endfunction

function! php#functions()
    silent execute "vimgrep /".php#funcregex()."/ %"
endfunction

function! php#format()
    let l:command = "php-cs-fixer --quiet --no-interaction fix --using-cache=no"
    call system(printf("%s %s", l:command, shellescape(expand("%"))))
    silent! checktime
endfunction
