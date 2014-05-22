if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.qml	setfiletype qml
	au! BufRead,BufNewFile *.pde  setfiletype arduino
	au! BufRead,BufNewFile *.ino  setfiletype arduino
augroup END
