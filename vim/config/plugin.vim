" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline_theme="minimalist"


" GitGutter
autocmd TextChanged * GitGutter




" JavaComplete
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#CompleteParamsInfo
endif


" Deoplete
let g:deoplete#enable_at_startup = 1


" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = "left"
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


" PyMode
let g:pymode_lint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1


" Simpylfold
let g:SimpylFold_docstring_preview = 1


" Supertab
let g:SuperTabDefaultCompletionType = "<c-space>"


" Ale
let g:ale_linters = {"python": ["flake8"], "python3": ["flake8"]}


" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Whitespace
autocmd BufEnter *[^(.rmd|.snippets)] EnableStripWhitespaceOnSave
autocmd BufEnter *.snippets DisableStripWhitespaceOnSave


" Yankstack
let g:yankstack_map_keys = 0
call yankstack#setup()
