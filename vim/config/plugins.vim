call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'

Plug 'andymass/vim-matchup'

" Accept .editorconfig
Plug 'editorconfig/editorconfig-vim'

" Miscellaneous Plugins

" Airline style status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Highlight and fix trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Yank History Cycling on meta-[shift]-p
Plug 'maxbrunsfeld/vim-yankstack'

" Auto indent
Plug 'yggdroot/indentline'

" Python folding
Plug 'tmhedberg/simpylfold'

" Update folding less often
Plug 'Konfekt/fastfold'

" Use FZF for browsing vim buffers
Plug 'junegunn/fzf.vim'

" Markdown support
Plug 'plasticboy/vim-markdown'

" Window resizing c-w [<>-+=_|]
Plug 'roxma/vim-window-resize-easy'

" Regex highlighting and in buffer live replacement
Plug 'markonm/traces.vim'

" Better comments
Plug 'scrooloose/nerdcommenter'

" Work on brackets in pairs
Plug 'jiangmiao/auto-pairs'

" NERDtree + Plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Compilers
Plug 'xuhdev/singlecompile'

" Autocomplete
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets'

" Coc extensions
Plug 'Maxattax97/coc-ccls'
Plug 'iamcco/coc-gitignore'
Plug 'neoclide/coc-python'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-java'

" Language Specific stuff (Language Plugins, Linters, etc)
" Asynchronous lint engine
Plug 'w0rp/ale'
" Python
Plug 'hdima/python-syntax'
Plug 'fs111/pydoc.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/javacomplete'
Plug 'udalov/kotlin-vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'pearofducks/ansible-vim'
Plug 'justinmk/vim-syntax-extra'
" Rust
Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'

Plug 'cespare/vim-toml'


" Git integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
    " dependency
    Plug 'mattn/webapi-vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'majutsushi/tagbar'
Plug 'jremmen/vim-ripgrep'

call plug#end()
