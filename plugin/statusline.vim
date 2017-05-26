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
            \ 's'  : 'VISUAL',
            \ 'S'  : 'VISUAL',
            \ '' : 'VISUAL',
            \ 'i'  : 'INSERT',
            \ 'R'  : 'REPLACE',
            \ 'Rv' : 'REPLACE',
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
set statusline+=\ %t
set statusline+=\ %{file#size()}
set statusline+=\ %l/%L:%c/%{&textwidth}
set statusline+=\ %p%{'%'}
set statusline+=\ %y
set statusline+=%{strlen(&fenc)&&&fenc!=#'utf-8'?'['.&fenc.']':''}
set statusline+=%{&spelllang!=#'en'?'['.&spelllang.']':''}
set statusline+=%{exists('b:largefile')?'[xxl]':''}
set statusline+=%{exists('*fugitive#head')&&exists('b:git_dir')?'['.fugitive#head(7).']':''}
set statusline+=%{scp#statusline()}
set statusline+=%{&ignorecase?'[i]':''}
set statusline+=%{&wrap?'[w]':''}
set statusline+=%{&paste?'[p]':''}
set statusline+=%{format#alerts(1)?'[!]':''}
set statusline+=%r
set statusline+=%m
set statusline+=%{exists('g:bgoutput')?'[*]':''}
set statusline+=%<

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
