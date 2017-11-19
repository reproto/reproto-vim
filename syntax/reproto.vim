" reproto syntax https://github.com/reproto

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn cluster reprotoCommentGrp contains=reprotoTodo

syn keyword reprotoTodo contained TODO FIXME XXX

syn keyword reprotoSyntax use as stream
syn keyword reprotoStorageClass type interface enum tuple service
syn match reprotoField /\<[a-zA-Z][_a-zA-Z0-9]*\s*?\?\(\s*:\)\@=/

syn match reprotoType /\<[A-Z][_a-zA-Z0-9]*\>/
syn keyword reprotoType float double boolean string bytes datetime u32 u64 i32 i64

syn keyword reprotoBool true false
syn match reprotoNumber /-\?\<\d\+\(\.\d\+\)\?\>/
syn region reprotoString start=/"/ skip=/\\./ end=/"/

syn region reprotoComment start="\/\*" end="\*\/" contains=@reprotoCommentGrp,@Spell
syn region reprotoCommentLine start="//" skip="\\$" end="$" contains=@reprotoCommentGrp,@Spell
syn region reprotoItemDoc start="///" end="$" contains=@reprotoCommentGrp,@Spell
syn region reprotoPackageDoc start="//!" end="$" contains=@reprotoCommentGrp,@Spell

hi def link reprotoTodo Todo

hi def link reprotoSyntax Include
hi def link reprotoStorageClass StorageClass
hi def link reprotoField Statement

hi def link reprotoType Type

hi def link reprotoBool Boolean
hi def link reprotoNumber Number
hi def link reprotoString String

hi def link reprotoComment Comment
hi def link reprotoCommentLine Comment
hi def link reprotoItemDoc SpecialComment
hi def link reprotoPackageDoc SpecialComment

let b:current_syntax = "reproto"
