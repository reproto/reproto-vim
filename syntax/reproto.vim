" reproto syntax https://github.com/reproto

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword reprotoTodo contained TODO FIXME XXX
syn cluster reprotoCommentGrp contains=reprotoTodo

syn keyword reprotoSyntax use as stream type interface enum tuple service
syn match reprotoField /\<[a-zA-Z][_a-zA-Z0-9]*\(?\?:\)\@=/
syn keyword reprotoOptional \?

syn match reprotoType /\<signed\(\/\d\+\)\?\>/
syn match reprotoType /\<unsigned\(\/\d\+\)\?\>/
syn match reprotoType /\<[A-Z][_a-zA-Z0-9]*\>/
syn keyword reprotoType float double boolean string bytes
syn keyword reprotoBool true false

syn match reprotoNumber /-\?\<\d\+\(\.\d\+\)\?\>/

syn region reprotoString start=/"/ skip=/\\./ end=/"/
syn region reprotoString start=/'/ skip=/\\./ end=/'/
syn region reprotoComment start="\/\*" end="\*\/" contains=@reprotoCommentGrp
syn region reprotoCommentLine start="//" skip="\\$" end="$" contains=@reprotoCommentGrp
syn region reprotoCommentLineDoc start="//\%(//\@!\|!\)" end="$" contains=@reprotoCommentGrp,@Spell

hi def link reprotoTodo Todo

hi def link reprotoNumber Number
hi def link reprotoComment Comment
hi def link reprotoCommentLine Comment
hi def link reprotoCommentLineDoc SpecialComment
hi def link reprotoString String

hi def link reprotoSyntax Include
hi def link reprotoField Statement
hi def link reprotoOptional Keyword
hi def link reprotoType Type
hi def link reprotoBool Boolean

let b:current_syntax = "reproto"
