
" Make sure plug.vim is present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  source ~/.vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

" Plugin Manager
source ~/.vim/config/plugins.vim

" Prepare central backup/swap/undo directory
let &undodir   = expand('~/.vim/.undo//')
let &backupdir = expand('~/.vim/.backup//')
let &directory = expand('~/.vim/.swp//')

syntax on
filetype plugin on
filetype plugin indent on

set encoding=utf-8

set foldmethod=syntax

" Use whitespace instead of tab
set expandtab

" Make a tabulator equal 4 spaces
set tabstop=4
set shiftwidth=4

" Enable persistent undo
set undofile

" Use relative line numbers
set number
set relativenumber

" Set linelength indicator to 120 characters
set cc=120

" Natural window splitting
set splitbelow
set splitright

" Set colors
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif

colorscheme happy_hacking

" Turn on the Wild menu
set wildmenu
set wildmode=list:longest


"
set updatetime=300

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
let mapleader=","

" Apply plugin configurations
source ~/.vim/config/pluginconfig.vim

" Apply custom keybindings
source ~/.vim/config/keybindings.vim

" Apply settings for custom filetypes
source ~/.vim/config/filetypes.vim

" Transparency
hi Normal guibg=NONE ctermbg=NONE

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly
set nofoldenable
