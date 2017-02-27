call surround#lightweight()
let b:autocompile=1
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('bash %')<CR>
setlocal makeprg=shellcheck\ -f\ gcc\ %\ \\\|\ grep\ -F\ '\ error:\ '
