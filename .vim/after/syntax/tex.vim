hi Folded cterm=NONE ctermfg=12 ctermbg=0
hi texRefZone cterm=NONE ctermfg=4 ctermbg=None

"Make <C-N>/<C-P> autocomplete with colons and underscores
" (e.g. sect:foo_and_bar)
setlocal iskeyword+=\:
setlocal iskeyword+=\_

"Make vim spellcheck work everywhere?
syntax spell toplevel

"Highlight multi-line comments
syn region texComment start="\\begin{comment}" end="\\end{comment}"
syn region texComment start="\\iffalse"        end="\\fi"
syn region texComment start="\\ifx true false" end="\\fi"
