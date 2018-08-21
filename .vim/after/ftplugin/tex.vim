" section jumping
noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
  let i = 0
  let pat = '^\s*\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
   let flags = 'W' . a:dir
   while i < a:cnt && search( pat, flags ) > 0
     let i = i+1
   endwhile
 endfunction

"Ignore certain filenames in completion (comma-separated)
setlocal wildignore=*.aux,*.log,*.make,*.bbl,*.blg,*.d,*.fls,*.out,*.pdf,*.temp

"Make ctrl-b and -i bold and italicize the selection, and ` put the
"selection into quotes.
vmap <C-B> c\textbf{}<ESC>Pf}l"
vmap <C-I> c\textit{}<ESC>Pf}l"
vmap ` c`'<ESC>hPW

"Don't spell check in comments
let g:tex_comment_nospell=1
