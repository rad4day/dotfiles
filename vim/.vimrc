set encoding=utf-8
execute pathogen#infect('plugins/{}')
execute pathogen#infect('snippets/{}')
autocmd vimenter * Helptags
syntax on
filetype plugin on
filetype plugin indent on
set number
set relativenumber
set autochdir
set expandtab

let &undodir = expand('~/.vim/.undo')
let &backupdir = expand('~/.vim/.backup//')
let &directory = expand('~/.vim/.swp//')
set undofile

colorscheme happy_hacking
source ~/.vim/config/plugin.vim
source ~/.vim/config/keybindings.vim

set tabstop=4
set shiftwidth=4
set cc=120
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_altv = 0
let g:netrw_banner = 0
let g:tex_conceal = ""

function! ForceResizeNetrw()
let curWin = winnr()
	for winnr in range(1, winnr('$'))
		if getwinvar(winnr, '&ft')=="netrw"
			if curWin != winnr
				silent noautocmd exec winnr 'wincmd w'
				silent noautocmd exec 'vertical resize ' . g:netrw_winsize
				silent noautocmd exec curWin 'wincmd w'
			else
				silent noautocmd exec 'vertical resize ' . g:netrw_winsize
			endif
		endif
	endfor
endfunction


autocmd WinEnter * call ForceResizeNetrw()
autocmd BufNew * call ForceResizeNetrw()

" R Markdown
function Rmarkdown()
    set filetype=markdown
    set conceallevel=0
    let g:markdown_syntax_conceal=0
    let g:markdown_fenced_languages=['r', 'python', 'html', 'sql', 'bash=sh']
endfunction
autocmd BufNewFile,BufReadPost *.Rmd call Rmarkdown()
autocmd BufNewFile,BufReadPost *.rmd call Rmarkdown()


" Transparency
hi Normal guibg=NONE ctermbg=NONE
