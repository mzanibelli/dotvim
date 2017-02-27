" Commands
command! -nargs=* GitDiff call git#diff()
command! -nargs=* GitLog call git#log()
command! -nargs=0 GitBlame call git#blame()
command! -nargs=0 GitRevert call git#revert()
command! -range -nargs=0 GitDetails call git#details(<line1>, <line2>)
command! -nargs=0 GitRoot call source#root("git")
