call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'

" Miscellaneous Plugins
Plug 'Shougo/neco-vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'yggdroot/indentline'
Plug 'tmhedberg/simpylfold'
Plug 'Konfekt/fastfold'
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'roxma/vim-window-resize-easy'
Plug 'markonm/traces.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'thaerkh/vim-workspace'

" NERDtree + Plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bonsaiben/bootstrap-snippets'
Plug 'rbonvall/snipmate-snippets-bib'
Plug 'rad4day/vim-custom-snippets'

" Compilers
Plug 'xuhdev/singlecompile'
Plug 'jiangmiao/auto-pairs'

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'

" Language Specific stuff (Language Plugins, Linters, etc)
Plug 'w0rp/ale'
" Plug 'klen/python-mode'
Plug 'hdima/python-syntax'
Plug 'fs111/pydoc.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/javacomplete'
Plug 'udalov/kotlin-vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'pearofducks/ansible-vim'
Plug 'justinmk/vim-syntax-extra'
Plug 'rhysd/vim-clang-format'

" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
    " dependency
    Plug 'mattn/webapi-vim'

call plug#end()
