" reproto syntax https://github.com/reproto

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn cluster reprotoCommentGrp contains=reprotoTodo

syn keyword reprotoTodo contained TODO FIXME XXX

syn match reprotoIdentifier /\<_*[a-z][_a-z0-9]*\>/
syn match reprotoCustomType /\<[A-Z][_a-zA-Z0-9]*\>/

syn match reprotoSyntax /?/
syn match reprotoSyntax /@/

syn keyword reprotoSyntax use as stream
syn keyword reprotoStorageClass type interface enum tuple service

syn keyword reprotoType any float double boolean string bytes datetime u32 u64 i32 i64

syn keyword reprotoBool true false
syn match reprotoNumber /-\?\<\d\+\(\.\d\+\)\?\>/
syn region reprotoString start=/"/ skip=/\\./ end=/"/

syn region reprotoComment start="\/\*" end="\*\/" contains=@reprotoCommentGrp,@Spell
syn region reprotoCommentLine start="//" skip="\\$" end="$" contains=@reprotoCommentGrp,@Spell
syn region reprotoItemDoc start="///" end="$" contains=@reprotoCommentGrp,@Spell
syn region reprotoPackageDoc start="//!" end="$" contains=@reprotoCommentGrp,@Spell

syn match reprotoPackage /\(use\s\+\)\@<=[a-zA-Z][_a-z0-9]*\(\.[a-zA-Z][_a-z0-9]*\)\+/
syn match reprotoUseAs /\(as\s\+\)\@<=[a-zA-Z][_a-z0-9]*/
syn match reprotoPrefix /\<[a-z][_a-z0-9]*\(\s*::\)\@=\>/

hi def link reprotoTodo Todo

hi def link reprotoIdentifier Statement
hi def link reprotoCustomType Type

hi def link reprotoSyntax StorageClass
hi def link reprotoStorageClass StorageClass

hi def link reprotoType Type

hi def link reprotoBool Boolean
hi def link reprotoNumber Number
hi def link reprotoString String

hi def link reprotoComment Comment
hi def link reprotoCommentLine Comment
hi def link reprotoItemDoc SpecialComment
hi def link reprotoPackageDoc SpecialComment

hi def link reprotoPackage Include
hi def link reprotoUseAs Include
hi def link reprotoPrefix Include

let b:current_syntax = "reproto"
