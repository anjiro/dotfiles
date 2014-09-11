"Vundle
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
set nocompatible
filetype on    "turn on for osx stock vim bug
filetype off   "turn off for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/UltiSnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'aklt/plantuml-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'JavaScript-Indent'
Plugin 'tpope/vim-repeat'
Plugin 'groenewege/vim-less'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-ragtag'
Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype plugin indent on
"to ignore plugin indent changes, instead use:
"filtype plugin on

set laststatus=2
set tabstop=2
set shiftwidth=2
set smarttab
set nowrap
set mouse=a

set ff=unix           "Automatically deal with dos files

colorscheme dancolors
if has('gui_running')
	set guifont=Monaco:h12
	set guioptions-=T   "remove toolbar from gui
endif

"Useful stuff at http://items.sjbach.com/319/configuring-vim-right

set hidden                  "Allow switching away from unwritten buffers
set history=1000            "Lines of command line history to save
runtime macros/matchit.vim  "Use % to match html tags and other stuff
set wildmenu                "Tab-complete command mode above command line
set wildmode=list:longest
set title                   "Make xterm title bar setting behave
set titleold=""
set titlestring=vim:\ %t
set shortmess=atI           "Set shorter status messages

"Fix matchit breaking {} etc matching in js files
au Filetype css,javascript let b:match_words = &matchpairs

"http://stackoverflow.com/questions/63104/smarter-vim-recovery
set directory=~/.vim/swap,.

syntax on              "Turn on syntax highlighting
filetype on
filetype plugin on
filetype indent on

"disable auto-insertion of comments on newline after comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Indenting
set autoindent
set shiftwidth=2

set wrapmargin=8

"Ensure indentation for python
autocmd FileType python setlocal shiftwidth=2 tabstop=2

"Allow reasonable backspace
set backspace=indent,eol,start

"Make +/= resize window
" Disabled as = to reindent is too handy!
"map + <C-W>+
"map = <C-W>-

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"Unicode
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"Make vim keep the scroll position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

let g:platuml_executable_script="plantuml"

"vile compatibility stuff
"------------------------

"Vile-esque status line
function Insertmode(mode)
	if index(["n", "no", "v", "V", "\<CTRL-V>", "r?", "!"], a:mode) >= 0
		return "="
	else
		return "I"
	endif
	return "="
endfunction
set fillchars=stl:=                         "Add ==s to fill statusline
set statusline==%{Insertmode(mode(1))}=\    "Set start to =(insert)= 
set statusline+=%t\                         "Add filename
set statusline+=%(%y\ %)                    "Type of file
set statusline+=%([%M%R%H]%)                "Mode indicators
set statusline+=%=                          "Right-align now
set statusline+=\ %((%l,%c)%)\ %p%%\ ==       "Position in file

"make zm work correctly
map zm zz

"make Q work correctly
map Q :q<CR>

"make ^N/^P work correctly
map <C-N> :bnext<CR>
map <C-P> :bprevious<CR>

"Multiple window behavior compatibility
"make tab go between windows
map <C-I> <C-W><C-W>
"make v and V change window size - not doing due to overwriting visual mode
"map v <C-W>-
"map V <C-W>+
"Make ^K kill the current window, ^O make the only window
map <C-K> <C-W>q
map <C-O> <C-W>o

"Show and switch to buffer
map _ :buffers<CR>:buffer<Space>

"Change f to t
noremap f t

"Commenting with T and t
let NERDDefaultAlign='start'
let NERDRemoveExtraSpaces=0
let NERD_c_alt_style=1  "Use // instead of /* */ for c code
let g:NERDCustomDelimiters = {
	\ 'plaintex': { 'left': '%' },
	\ 'tex':      { 'left': '%' }
\ }
noremap T :call NERDComment('n', 'sexy')<CR>j
noremap t :call NERDComment('n', 'uncomment')<CR>j

"Make :e work with mulitple files by replacing it with :args
cnoreabbrev <expr> e getcmdtype() == ":" && getcmdline() == 'e' ? 'ar' : 'e'

"Make { and } ignore whitespace
"Source: http://stackoverflow.com/questions/1853025/make-and-ignore-lines-containing-only-whitespace
function! ParagraphMove(delta, visual, count)
    normal m'
    normal |
    if a:visual
        normal gv
    endif

    if a:count == 0
        let limit = 1
    else
        let limit = a:count
    endif

    let i = 0
    while i < limit
        if a:delta > 0
            " first whitespace-only line following a non-whitespace character           
            let pos1 = search("\\S", "W")
            let pos2 = search("^\\s*$", "W")
            if pos1 == 0 || pos2 == 0
                let pos = search("\\%$", "W")
            endif
        elseif a:delta < 0
            " first whitespace-only line preceding a non-whitespace character           
            let pos1 = search("\\S", "bW")
            let pos2 = search("^\\s*$", "bW")
            if pos1 == 0 || pos2 == 0
                let pos = search("\\%^", "bW")
            endif
        endif
        let i += 1
    endwhile
    normal |
endfunction

nnoremap <silent> } :<C-U>call ParagraphMove( 1, 0, v:count)<CR>
onoremap <silent> } :<C-U>call ParagraphMove( 1, 0, v:count)<CR>
" vnoremap <silent> } :<C-U>call ParagraphMove( 1, 1)<CR>
nnoremap <silent> { :<C-U>call ParagraphMove(-1, 0, v:count)<CR>
onoremap <silent> { :<C-U>call ParagraphMove(-1, 0, v:count)<CR>
" vnoremap <silent> { :<C-U>call ParagraphMove(-1, 1)<CR>

" Show < or > when characters are not displayed on the left or right.
:set list listchars=precedes:<,extends:>,tab:\ \ 

"Always jump to matching brace
let b:match_debug=1

"Underlining
function! Underline()
	let uchar = nr2char(getchar())
	let nr_columns = virtcol('$') - 1
	let uline = repeat(uchar, nr_columns)
	put =strpart(uline, 0, nr_columns)
endfunction
map - :call Underline()<CR>
