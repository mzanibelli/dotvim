syntax clear

syn match yamlBlock "[\[\]\{\}\|\>]"
syn region yamlComment	start="\#" end="$"
syn match yamlIndicator	"#YAML:\S\+"
syn region yamlString	start="'" end="'" skip="\\'"
syn region yamlString	start='"' end='"' skip='\\"' contains=yamlEscape
syn match  yamlEscape	+\\[abfnrtv'"\\]+ contained
syn match  yamlEscape	"\\\o\o\=\o\=" contained
syn match  yamlEscape	"\\x\x\+" contained
syn match  yamlType	"!\S\+"
syn keyword yamlConstant NULL  Null  null  NONE None none NIL Nil nil
syn keyword yamlConstant TRUE  True  true  YES  Yes  yes  ON  On  on
syn keyword yamlConstant FALSE False false NO   No   no   OFF Off off
syn match yamlKey	 "^\s*\zs[^ \t\"]\+\ze\s*:"
syn match yamlKey	 "^\s*-\s*\zs[^ \t\"\']\+\ze\s*:"
syn match yamlAnchor "&\S\+"
syn match yamlAlias	 "*\S\+"

hi link yamlConstant  Keyword
hi link yamlIndicator PreCondit
hi link yamlAnchor    Function
hi link yamlAlias     Function
hi link yamlKey       Identifier
hi link yamlType      Type
hi link yamlComment   Comment
hi link yamlBlock     Operator
hi link yamlString    String
hi link yamlEscape    Special
