"Note on new install need to follow
" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/

"Bypass python3 vim bug:
" https://github.com/vim/vim/issues/3117#issuecomment-402622616
if has('python3')
	silent! python3 1
endif

"don't allow python recommended settings
let g:python_recommended_style=0

" see :h vundle for more details or wiki for FAQ
set nocompatible
filetype on    "turn on for osx stock vim bug
filetype off   "turn off for vundle
set shell=/bin/bash

call plug#begin('~/.vim/bundle')
Plug 'ervandew/supertab'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'Valloric/YouCompleteMe'
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'othree/html5.vim'
Plug 'tpope/vim-repeat'
Plug 'groenewege/vim-less'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-ragtag'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'choffee/openscad.vim'
Plug 'zirrostig/vim-smart-swap'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/visualrepeat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/VisIncr'
Plug 'tmhedberg/SimpylFold'
Plug 'maksimr/vim-jsbeautify'
"Plug 'einars/js-beautify'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/ingo-library'
Plug 'gregjurman/vim-nc'
Plug 'vim-scripts/closeb'
Plug 'justinmk/vim-ipmotion'
"Forked from jiagmiao but only activates with whitespace to right
"Plug 'optroot/auto-pairs.git'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Konfekt/FastFold'
"Plug 'lervag/vimtex'
"Plug 'jeetsukumaran/vim-markology'
"Plug 'tpope/vim-sleuth'
Plug 'vim-voom/VOoM'
Plug 'qpkorr/vim-bufkill'
Plug 'alvan/vim-closetag'
"Plug 'chrisbra/csv.vim'
"Plug 'justinj/vim-pico8-syntax'
Plug 'andmatand/vim-pico8-syntax'
Plug 'gabrielelana/vim-markdown'
Plug 'tpope/vim-eunuch'
" Javascript, typescript, react
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'bronson/vim-visual-star-search'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

packadd! matchit

"Fix plugin problems with å character (https://github.com/jiangmiao/auto-pairs/issues/88)
let g:AutoPairsShortcutFastWrap=''

"fix vim-bookmarks stealing ma
let g:bookmark_no_default_key_mappings = 1

let g:AutoPairsOnlyBeforeClose=1
"256 colors
set t_Co=256

nnoremap <F5> :GundoToggle<CR>

"Make scrolling with the mouse wheel go by single lines
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"Set F11 to show the yank ring
"nnoremap <silent> <F11> :YRShow<CR>

"Speed up tex syntax highlighting by using an older regular expression
"engine.
"set re=1 

"Turn on relative numbers with the current line number on the current
"line
set number relativenumber
"Use only 2 columns (+1) for :set relativenumber
set numberwidth=2

"Always recognize .tex files as latex
let g:tex_flavor = "latex"

"Make gf edit the file under the cursor even if it doesn't exist
map gf :e <cfile><CR>

set tags=./tags;/  "Search parent directories for .tags files

set laststatus=2
set tabstop=2
set shiftwidth=2
set smarttab
set nowrap
set mouse=a
set textwidth=70  "Wrap properly with any number of columns
set nojoinspaces  "Prevent J from adding 2 spaces after a period

set ff=unix           "Automatically deal with dos files

set cursorcolumn  "Highlight column of cursor

"Fix mouse issues with wider iTerm2s
if has('mouse_sgr')
    set ttymouse=sgr
endif

"colorscheme dancolors
let g:solarized_termtrans = 1
syntax on
"let g:solarized_termcolors = 16
set background=dark
colorscheme solarized
function! ToggleSolarizedFunc()
	if &background == "dark"
		execute "!echo -ne '\033]50;SetProfile=Solarized light\a'"
		set background=light
	else
		execute "!echo -ne '\033]50;SetProfile=Solarized dark default\a'"
		set background=light
	endif
endfunction
command! ToggleSolarized call ToggleSolarizedFunc()
nnoremap <F12> :ToggleSolarized<CR>

if has('gui_running')
	set guifont=Monaco:h12
	set guioptions-=T   "remove toolbar from gui
endif

"Useful stuff at http://items.sjbach.com/319/configuring-vim-right

set hidden                  "Allow switching away from unwritten buffers
set history=1000            "Lines of command line history to save
"runtime macros/matchit.vim  "Use % to match html tags and other stuff
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

"disable auto-insertion of comments on newline after pressing return
" or o on a comment line; remove comment leader when joining lines
autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions+=j

"Indenting
set autoindent
set shiftwidth=2

set wrapmargin=8

"Ensure indentation for python
autocmd FileType python setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType pyrex  setlocal shiftwidth=2 tabstop=2 noexpandtab

"My style of comments for python
autocmd FileType python setlocal comments-=b:# comments+=s:#,mb:#,eb:#

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

inoremap <C-O> <ESC>O

"vile compatibility stuff
"------------------------
noremap  <C-G> g<C-G>
vnoremap <C-G> g<C-G>

"Vile-esque status line
function! Insertmode(mode)
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
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>

"Make ^E go to the end of the line in insert mode
imap <C-E> <ESC>$A


"Multiple window behavior compatibility
"make tab go between windows
nnoremap <C-I> <C-W><C-W>
"make v and V change window size - not doing due to overwriting visual mode
"map v <C-W>-
"map V <C-W>+
"Make ^K kill the current window, ^O make the only window
"map <C-K> <C-W>c
"nnoremap <C-O> <C-W>o

"Map ctrl-movement keys to navigating between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Show and switch to buffer
map _ :buffers<CR>:buffer<Space>

"Change f to t
"noremap f t

"Commenting with T and t
"let NERDDefaultAlign='start'
"let NERDRemoveExtraSpaces=0
"let NERD_c_alt_style=1  "Use // instead of /* */ for c code
"let g:NERDCustomDelimiters = {
"	\ 'plaintex': { 'left': '%' },
"	\ 'tex':      { 'left': '%' }
"\ }
"Use \cl instead
"noremap T :call NERDComment('n', 'comment')<CR>j
"noremap t :call NERDComment('n', 'uncomment')<CR>j

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
"set list listchars=precedes:<,extends:>,tab:\ \ 

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

"Fold latex
let g:tex_fold_enabled=1
autocmd FileType tex setlocal fdm=syntax
autocmd FileType tex setlocal spell

"Vim-latex settings
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'

"Use ctrl-right and ctrl-left to expand and split window and undo this;
" make sure iTerm2 profile under Window tab allows session-initiated window
" resizing!
function! SizeUpFunc()
	if exists("g:oldColumns")
		return
	endif
	let g:oldColumns = &columns
	au VimLeave * SizeDown
	set columns=160
	vsplit
endfunction
command! SizeUp call SizeUpFunc()

function! SizeDownFunc()
	if !exists("g:oldColumns")
		return
	endif
	only   "Remove window split
	let &columns = g:oldColumns
	unlet g:oldColumns
endfunction
command! SizeDown call SizeDownFunc()

map <C-Right> :SizeUp<CR>
map <C-Left> :SizeDown<CR>

"Press \vs to create two columns linked together
" Source: http://superuser.com/a/244031/24583
noremap <silent> <Leader>vs ggzR:<C-u>let @z=&so<CR>:set so=0 noscb<CR>:set columns=160<CR>:bo vs<CR>zRLjzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"Press \w to search for the current word in the other window
" Source: http://vim.wikia.com/wiki/Search_for_current_word_in_new_window
nnoremap <Leader>w :let @/=expand("<cword>")<Bar>wincmd w<Bar>normal n<CR>

"Syntastic recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 0

"Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Don't close any folds on opening a file
set foldlevelstart=99

"Preview docstring in Python folds, but don't fold them
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0

set foldtext=MyFoldText()
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub
endfunction

"Line wrapping for long lines
function! WrapFunc()
	setl wrap linebreak bri
	set display+=lastline
	set textwidth=0  "don't wrap
	set wrapmargin=0 "don't wrap
	map <buffer> j gj
	map <buffer> k gk
	map <buffer> $ g$
	map <buffer> ^ g^
	map <buffer> 0 g^
endfunction
command! Wrap call WrapFunc()

let g:airline_powerline_fonts = 1

"Convert rich text on the clipboard to Markdown
command PasteMarkdown :read !if encoded=`osascript -e 'the clipboard as «class HTML»'` 2>/dev/null; then echo $encoded | perl -ne 'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))' | pandoc --wrap=none -f HTML -t markdown; else pbpaste; fi
nnoremap ,pmd :PasteMarkdown<CR>

function! PythonSpaces()
	set expandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
endfunction
command! PySpace call PythonSpaces()


"COC configuration
"" Disable ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

