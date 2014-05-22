"Color numbers: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256   "Set environment to 256 colours

let colors_name = "dancolors"

if version >= 700
  hi CursorLine     ctermbg=16
  hi CursorColumn   ctermbg=16
  hi MatchParen      ctermfg=195 ctermbg=16 cterm=bold
  hi Pmenu           ctermfg=255 ctermbg=236
  hi PmenuSel        ctermfg=255 ctermbg=71
endif

" Background and menu colors
"hi Cursor            ctermbg=255 gui=none
"hi Normal            ctermfg=255 ctermbg=16 cterm=none
"hi NonText           ctermfg=255 ctermbg=233 cterm=none
"hi LineNr            ctermfg=255 ctermbg=234 cterm=none
"hi StatusLine        ctermfg=255 ctermbg=233 cterm=italic
"hi StatusLineNC      ctermfg=255 ctermbg=236 cterm=none
"hi VertSplit         ctermfg=255 ctermbg=234 cterm=none
"hi Folded            ctermfg=255 ctermbg=16 cterm=none
"hi Title             guibg=NONE	ctermfg=71 ctermbg=NONE cterm=bold
"hi Visual            ctermfg=191 ctermbg=236 cterm=none
"hi SpecialKey        ctermfg=189 ctermbg=233 cterm=none
"hi DiffChange       ctermbg=58 cterm=none
"hi DiffAdd          ctermbg=236 cterm=none
"hi DiffText         ctermbg=241 cterm=none
"hi DiffDelete       ctermbg=52 cterm=none

hi NonText          guifg=#6678ff

hi Normal           guifg=#00ff00 guibg=#232323
 
hi DiffChange       ctermbg=234 cterm=none
hi DiffAdd          ctermbg=17 cterm=none
hi DiffText         ctermbg=22 cterm=none
hi DiffDelete       ctermbg=0 ctermfg=196 cterm=none
hi TabLineFill      ctermbg=235 ctermfg=228 cterm=none
hi TabLineSel       ctermfg=230 cterm=bold

hi Folded           ctermbg=none  ctermfg=14 

" Syntax highlighting
hi Comment          ctermfg=7    guifg=#bbbbbb
hi Constant         ctermfg=8    guifg=#555555
hi Identifier       ctermfg=9    guifg=#bbbbff
hi Statement        ctermfg=3    guifg=#bbbb00
hi Special          ctermfg=3    guifg=#bbbb00
hi PreProc          ctermfg=3    guifg=#bbbb00
hi Keyword          ctermfg=3    guifg=#bbbb00
hi String           ctermfg=6    guifg=#00bbbb
hi Type             ctermfg=6    guifg=#00bbbb
hi pythonBuiltin    ctermfg=5    guifg=#bb00bb
hi TabLineFill      ctermfg=14   guifg=#ffff55
hi pythonBuiltinObj ctermfg=5    guifg=#bb00bb
hi Number           ctermfg=none
hi Function         ctermfg=none

"hi Entity ctermfg=5
"hi Support ctermfg=5

