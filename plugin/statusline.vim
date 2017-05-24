" Plugin
if exists('g:loaded_local_plugin_statusline')
    finish
endif
let g:loaded_local_plugin_statusline = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:currentmode = {
            \ 'n'  : 'NORMAL',
            \ 'v'  : 'VISUAL',
            \ 'V'  : 'VISUAL',
            \ '' : 'VISUAL',
            \ 's'  : 'SELECT',
            \ 'S'  : 'SELECT',
            \ '' : 'SELECT',
            \ 'i'  : 'INSERT',
            \ 'R'  : 'REPLACE',
            \ 'Rv' : 'REPLACE',
            \ 'c'  : 'NORMAL',
            \ 'cv' : 'NORMAL',
            \ 'ce' : 'NORMAL',
            \ 'r'  : 'NORMAL',
            \ 'rm' : 'NORMAL',
            \ 'r?' : 'NORMAL',
            \ '!'  : 'NORMAL',
            \}

" Options
set statusline=\ %{g:currentmode[mode()]}
set statusline+=\ #%n
set statusline+=\ %t
set statusline+=\ %{file#size()}
set statusline+=\ %l/%L:%c/%{&textwidth}
set statusline+=\ %p%{'%'}
set statusline+=\ %y
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]
set statusline+=%{&ignorecase?'[i]':''}
set statusline+=%{&wrap?'[w]':''}
set statusline+=%{&paste?'[p]':''}
set statusline+=[%{&spelllang}]
set statusline+=%r
set statusline+=%m
set statusline+=%{format#alerts(1)?'[!]':''}
set statusline+=%{exists('b:largefile')?'[xxl]':''}
set statusline+=%{scp#statusline()}
set statusline+=%{exists('b:git_dir')?'['.fugitive#head(7).']':''}
set statusline+=%{exists('g:bgoutput')?'[*]':''}
set statusline+=%<

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
