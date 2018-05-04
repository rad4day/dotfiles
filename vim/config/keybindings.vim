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

" Syntastic
nnoremap <F2> :SyntasticToggleMode<CR>

" SingleCompile
nmap <F8> :SCChooseCompiler<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

nmap <C-c> g~iw

" Rmarkdown
autocmd Filetype rmd nmap <F5> :w\|:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd Filetype rmd imap <F5> <ESC><ESC>:w\|:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
