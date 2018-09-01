" Plugin Manager
execute pathogen#infect('plugins/{}')
execute pathogen#infect('snippets/{}')

" Prepare central backup/swap/undo directory
let &undodir   = expand('~/.vim/.undo')
let &backupdir = expand('~/.vim/.backup//')
let &directory = expand('~/.vim/.swp//')

syntax on
filetype plugin on
filetype plugin indent on

set encoding=utf-8

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
colorscheme happy_hacking


" Apply plugin configurations
source ~/.vim/config/plugin.vim

" Apply custom keybindings
source ~/.vim/config/keybindings.vim

" Apply settings for custom filetypes
source ~/.vim/config/filetypes.vim

" Rebuild help files on startup
autocmd vimenter * Helptags

" Transparency
hi Normal guibg=NONE ctermbg=NONE
