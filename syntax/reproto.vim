" reproto syntax https://github.com/reproto

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword reprotoTodo contained TODO FIXME XXX
syn cluster reprotoCommentGrp contains=reprotoTodo

syn keyword reprotoSyntax    use as
syn keyword reprotoStructure enum package tuple type interface
syn match   reprotoField     /[a-zA-Z][_a-zA-Z0-9]*\(?\?:\)\@=/
syn keyword reprotoOptional  ?

syn match   reprotoType /\<signed\(\/\d\+\)\?/
syn match   reprotoType /\<unsigned\(\/\d\+\)\?/
syn match   reprotoType /[A-Z][_a-zA-Z0-9]*/
syn keyword reprotoType float double boolean string bytes
syn keyword reprotoBool true false

syn match   reprotoInt     /-\?\<\d\+\>/
syn match   reprotoInt     /\<0[xX]\x+\>/
syn region  reprotoString  start=/"/ skip=/\\./ end=/"/
syn region  reprotoString  start=/'/ skip=/\\./ end=/'/
syn region  reprotoComment start="\/\*" end="\*\/" contains=@reprotoCommentGrp
syn region  reprotoComment start="//" skip="\\$" end="$" keepend contains=@reprotoCommentGrp

hi def link reprotoTodo      Todo

hi def link reprotoInt       Number
hi def link reprotoComment   Comment
hi def link reprotoString    String

hi def link reprotoSyntax    Include
hi def link reprotoStructure Structure
hi def link reprotoField     Statement
hi def link reprotoOptional  Keyword
hi def link reprotoType      Type
hi def link reprotoBool      Boolean

let b:current_syntax = "reproto"
