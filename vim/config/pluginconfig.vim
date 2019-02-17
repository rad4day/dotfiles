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


" NerdTree
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '🗀'
let g:NERDTreeDirArrowCollapsible = '🗁'
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" autoclose if nerdtree is last open window
augroup NERDTree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

" PyMode
let g:pymode_lint = 0
let g:pymode_syntax = 0
let g:pymode_syntax_all = 1

" python syntax
let g:python_highlight_all = 1


" Simpylfold
let g:SimpylFold_docstring_preview = 1


" Supertab
let g:SuperTabDefaultCompletionType = "<c-space>"


" Ale
let g:ale_linters = {"python": ["flake8"], "python3": ["flake8"]}


" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" VIM-MARKDOWN
let g:markdown_syntax_conceal=0
let g:vim_markdown_conceal = 0


" Whitespace
autocmd BufEnter *[^(.rmd|.snippets)] EnableStripWhitespaceOnSave
autocmd BufEnter *.snippets DisableStripWhitespaceOnSave


" Workspaces
let g:workspace_session_name = '.vsession'
let g:workspace_autosave = 0
let g:workspace_autosave_untrailspaces = 0

" Yankstack
let g:yankstack_map_keys = 0
call yankstack#setup()
