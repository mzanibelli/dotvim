function! php#format()
    call format#format()
    call windows#preserve('g/\v^(\s+\=)@!/s/\v\s+\=/ =/g')
    call windows#preserve('%s/\v\=\s+/= /g')
    call windows#preserve('%s/){/) {/g')
    call windows#preserve('%s/\<if(/if (/g')
    call windows#preserve('%s/\<elseif(/elseif (/g')
    call windows#preserve('%s/\<switch(/switch (/g')
    call windows#preserve('%s/\<while(/while (/g')
    call windows#preserve('%s/\<for(/for (/g')
    call windows#preserve('%s/\<foreach(/foreach (/g')
    call windows#preserve('%s/\<else{/else {/g')
    call windows#preserve('%s/}else/} else/g')
    call windows#preserve('%s/\v[^ ]\zs\=\>\ze[^ ]/ => /g')
endfunction

function! php#extract()
    if visualmode() ==# "v"
        let l:name = input("Variable name : ")
        execute "normal! gvc$".l:name
        execute "normal! O$".l:name." = "
        execute "normal! pA;"
        redraw!
        echom "Replace ".@"." with $".l:name
        if confirm("Continue ?", "&Yes\n&No") == 1
            let l:next_line = line(".") + 2
            if l:next_line <= line("$")
                execute l:next_line.",$sno/".@"."/$".l:name."/gc"
            endif
        endif
    endif
endfunction

function! php#funcregex()
    return '\(.*\%#\)\@!\_^\s*\zs\(\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\)'
endfunction

function! php#functions()
    call search#ilist2qf('/'.php#funcregex().'/')
endfunction
