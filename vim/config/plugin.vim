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

" GoldenView
let g:goldenview__enable_default_mapping = 0
let g:goldenview__ignore_urule = {
    \   'filetype' : [
    \     ''        ,
    \     'qf'      , 'vimpager', 'undotree', 'tagbar',
    \     'nerdtree', 'vimshell', 'vimfiler', 'voom'  ,
    \     'tabman'  , 'unite'   , 'quickrun', 'Decho' ,
	\     'netrw' ,
    \   ],
    \   'buftype' : [
    \     'nofile'  ,
    \   ],
    \   'bufname' : [
    \     'GoToFile'                  , 'diffpanel_\d\+'      ,
    \     '__Gundo_Preview__'         , '__Gundo__'           ,
    \     '\[LustyExplorer-Buffers\]' , '\-MiniBufExplorer\-' ,
    \     '_VOOM\d\+$'                , '__Urannotate_\d\+__' ,
    \     '__MRU_Files__' ,
    \   ],
    \}
let g:goldenview__restore_urule = {
   \   'filetype' : [
    \     'nerdtree', 'vimfiler', 'netrw',
    \   ],
    \   'bufname' : [
    \     '__MRU_Files__' ,
    \   ],
    \ }


" JavaComplete
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#CompleteParamsInfo
endif

" Deoplete
let g:deoplete#enable_at_startup = 1

" NeoComplete
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = "left"
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" PythonSyntax
let python_highlight_all = 1

" Simpylfold
let g:SimpylFold_docstring_preview = 1

" Supertab
let g:SuperTabDefaultCompletionType = "<c-space>"

" Ale
let g:ale_linters = {"python": ["flake8"]}

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Whitespace
autocmd BufEnter *[^(.rmd|.snippets)] EnableStripWhitespaceOnSave
autocmd BufEnter *.snippets DisableStripWhitespaceOnSave

" Yankstack
let g:yankstack_map_keys = 0
call yankstack#setup()
