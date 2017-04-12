function! sudo#setup(file)
    if !filereadable(a:file) && !exists('#BufReadCmd#'.fnameescape(a:file))
        execute 'autocmd BufReadCmd ' fnameescape(a:file) 'call sudo#readcmd()'
    endif
    if !filewritable(a:file) && !exists('#BufWriteCmd#'.fnameescape(a:file))
        execute 'autocmd BufReadPost ' fnameescape(a:file) 'setlocal noreadonly'
        execute 'autocmd BufWriteCmd ' fnameescape(a:file) 'call sudo#writecmd()'
    endif
endfunction

function! sudo#readcmd()
    silent %delete_
    let l:pipe = printf(&shellpipe . (&shellpipe =~ '%s' ? '' : ' %s'), '/dev/null')
    execute (has('gui_running') ? '' : 'silent') 'read !env SUDO_EDITOR=cat VISUAL=cat sudo -e "%" ' . l:pipe
    silent 1delete_
    setlocal nomodified
endfunction

function! sudo#writecmd()
    execute (has('gui_running') ? '' : 'silent') 'write !env SUDO_EDITOR=tee VISUAL=tee sudo -e "%" >/dev/null'
    let &modified = v:shell_error
endfunction
