" Plugin
if exists('g:loaded_local_plugin_statusline')
    finish
endif
let g:loaded_local_plugin_statusline = 1

" Variables
let g:currentmode = {
    \ 'n'  : 'NORMAL',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'VISUAL',
    \ '' : 'VISUAL',
    \ 's'  : 'VISUAL',
    \ 'S'  : 'VISUAL',
    \ '' : 'VISUAL',
    \ 'i'  : 'INSERT',
    \ 'R'  : 'REPLACE',
    \ 'Rv' : 'REPLACE',
    \ 't' :  'TERMINAL',
    \ 'c'  : '-',
    \ 'cv' : '-',
    \ 'ce' : '-',
    \ 'r'  : '-',
    \ 'rm' : '-',
    \ 'r?' : '-',
    \ '!'  : '-',
    \}

" Options
set statusline=[%{g:currentmode[mode()]}]
set statusline+=\ #%n
set statusline+=\ %{file#size()}
set statusline+=\ %l/%L:%c/%{&textwidth}
set statusline+=\ %p%{'%'}
set statusline+=\ %{empty(&ft)?'[none]':'['.&ft.']'}
set statusline+=%{strlen(&fenc)&&&fenc!=#'utf-8'?'['.&fenc.']':''}
set statusline+=%{file#readonly()?'[-]':''}
set statusline+=%{&ignorecase?'[i]':''}
set statusline+=%{&wrap?'[w]':''}
set statusline+=%{&paste?'[p]':''}
set statusline+=%{exists('g:nocompile')&&g:nocompile==1?'[#]':''}
set statusline+=%{format#alerts()?'[!]':''}
set statusline+=%{&modified?'[+]':''}
set statusline+=%{exists('g:threads')&&!empty(g:threads)?'[*]':''}
set statusline+=%<
