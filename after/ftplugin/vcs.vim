" Init
call sessions#disable()
call windows#preserve("%sort")
call windows#preserve("%!uniq")

" Variables
let b:norestore=1
let b:completiontype="\<C-X>\<C-F>"
