" Vim syntax file

" Literals
syn keyword Constant    null
syn region  String      start='"' skip='\\"\|\\\\' end='"'
syn region  Error       start="'" end="'"
syn match   Character   /'\([][ -&(-Z^-~]\|\\[abfnrtv\'"?0]\|\\x[0-9a-fA-F][0-9a-fA-F]\)'/
syn match   Number      /[-+]\?[0-9]\+[CL]\?/
syn match   Number      /[-+]\?0x[0-9a-fA-F]\+[CL]\?/
syn keyword Boolean     false true
syn match   guFixed     /[-+]\?[0-9]\+\.[0-9]\+L\?\(_[0-9][0-9]\?\)\?/
hi def link guFixed     Float

" Functions
syn match   Function    /^[a-zA-Z_][a-zA-Z_0-9]*\([ \t]*(\)\@=/
syn match   Function    /[^a-zA-Z_0-9]\@<=[a-zA-Z_][a-zA-Z_0-9]*\([ \t]*(\)\@=/

" Type names at declaration
syn match   guTypeDeclName  /\(\(record\|class\)[ \t]\+\)\@<=[a-zA-Z_][a-zA-Z_0-9]*/
hi def      guTypeDeclName  term=bold cterm=bold ctermfg=250 gui=bold

" Statements
syn keyword Statement   return break continue free
syn keyword Conditional if else
syn keyword Repeat      while for
syn match   Label       /@[a-zA-Z_0-9]\+/
" Operators
syn match   Operator    /\([-+~!&*<>^|/%]\|[][]\)/
syn match   Operator    /==\|!=\|<=\|>=/
syn match   Operator    /\([-+*&^|/%]\|<<\|>>>\?\)=/he=e-1
syn keyword Operator    alloc recordtypeof
" Misc Keywords
syn keyword Keyword     section pure function implicit cast commutative operation

" The 'act like' member
syn keyword Special     _
" Member access
syn match   Special     /\.\|->/
" Section delimiter
syn match   Delimiter   /:/

" Keywords colored like C preprocessor directives
syn keyword Include     include
syn keyword Define      const

" Type keywords
syn keyword Type        unsigned signed int long char
syn match   Type        /^fixed\(([0-9][0-9]\?)\)\?/
syn match   Type        /[^a-zA-Z_0-9]\@<=fixed\(([0-9][0-9]\?)\)\?/
syn keyword StorageClass    public protected sheltered private subset abstract subclass
syn keyword Structure   record class

" Todo items only highlight in comments
syn keyword Todo        contained TODO FIXME XXX

" Comments override everything except strings
syn region  Comment     start="/\*" end="\*/" contains=Todo
