" No Arrowkeys
no <up> <NOP>
no <down> <NOP>
no <left> <NOP>
no <right> <NOP>
ino <up> <NOP>
ino <down> <NOP>
ino <left> <NOP>
ino <right> <NOP>
vno <up> <NOP>
vno <down> <NOP>
vno <left> <NOP>
vno <right> <NOP>

" Misc Keybindings
let mapleader = ","

" Buffers
nmap  <F3> :Buffers<CR>
imap <F3> <ESC><ESC>:Buffers<CR>
vmap <F3> <ESC><ESC>:Buffers<CR>

" Nerdtree
nmap <silent> <F4> <ESC>:NERDTreeToggle<CR>

" Workspaces
nmap <F6> :ToggleWorkspace<CR>

" SingleCompile
nmap <F8> :SCChooseCompiler<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Window Movement
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>

" Yankstack
nmap <silent> <S-P> <Plug>yankstack_substitute_newer_paste
nmap <silent> <C-P> <Plug>yankstack_substitute_older_paste

" CTRL + Space = Autocomplete
inoremap <C-space> <C-N>
imap <C-@> <C-Space>

cmap w!! w !sudo tee > /dev/null %

" Toggle Case
nmap <C-c> g~iw

nmap <F2> :TagbarToggle<CR>

" Rmarkdown
autocmd Filetype rmd nmap <F5> :w\|:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd Filetype rmd imap <F5> <ESC><ESC>:w\|:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

map <F1> <Esc>
imap <F1> <Esc>
