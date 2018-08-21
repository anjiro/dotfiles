if exists("b:current_syntax")
    finish
endif

syntax match gCode "\<G\d\+\>"
syntax match mCode "\<M\d\+\>"
syntax match gCodeComment ";.*$"
syntax match argument "\<[XYZFPSIJDHFRQEN]\zs\(-\?\d*\)\>"
syntax match argument "\<[XYZFPSIJDHFRQEN]\zs\(-\?\d*\.\d\+\)\>"
syntax match argumentK "\<[XYZFPSIJDHFRQEN]\&-\?\d*\>"
"syntax match argumentK "\s\U"

highlight default link gCodeComment Comment
highlight default link gCode Keyword
highlight default link mCode Keyword
highlight default link argumentK Error

let b:current_syntax = "gcode"
