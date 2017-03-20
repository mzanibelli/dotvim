" Commands
command! -buffer -range -nargs=0 Entities PreserveView call html#entities(<line1>, <line2>)

" Variables
let b:autoclose = ['tag', 'quote', 'tpl']
